# frozen_string_literal: true

# VisionApiController interacts with Google Cloud Vision API to process images.
class VisionApiController < ApplicationController
  require 'google/cloud/vision'
  require 'net/http'
  require 'uri'
  require 'json'

  def upload
    credentials_hash = google_credentials

    image_annotator_client = initialize_image_annotator_client(credentials_hash)
    image_path = params[:image].path

    response = perform_label_detection(image_annotator_client, image_path)

    if valid_response?(response)
      translated_label = translate_first_label(response)
      render_json_response(translated_label)
    else
      render_empty_response
    end
  end

  private

  def google_credentials
    JSON.parse(Rails.application.credentials.dig(:google_cloud, :credentials))
  end

  def initialize_image_annotator_client(credentials_hash)
    Google::Cloud::Vision.image_annotator do |config|
      config.credentials = credentials_hash
    end
  end

  def perform_label_detection(image_annotator_client, image_path)
    image_annotator_client.label_detection(image: image_path)
  end

  def valid_response?(response)
    response.responses.any? && response.responses.first.label_annotations.any?
  end

  def translate_first_label(response)
    first_label = response.responses.first.label_annotations.first.description
    translate_text(first_label)
  end

  def render_json_response(translated_label)
    @label_data = { translated_name: translated_label }
    respond_to do |format|
      format.json { render json: @label_data }
    end
  end

  def render_empty_response
    respond_to do |format|
      format.json { render json: {} }
    end
  end

  def translate_text(text)
    api_key = fetch_deepl_api_key
    url = build_deepl_url
    request = build_deepl_request(url, text, api_key)

    response = send_deepl_request(url, request)
    parse_translation_response(response)
  end

  def fetch_deepl_api_key
    Rails.application.credentials.dig(:deepl, :api_key)
  end

  def build_deepl_url
    URI.parse('https://api-free.deepl.com/v2/translate')
  end

  def build_deepl_request(url, text, api_key)
    request = Net::HTTP::Post.new(url.to_s)
    request['Authorization'] = "DeepL-Auth-Key #{api_key}"
    request.set_form_data({
                            'text' => text,
                            'target_lang' => 'JA'
                          })
    request
  end

  def send_deepl_request(url, request)
    Net::HTTP.start(url.host, url.port, use_ssl: true) do |http|
      http.request(request)
    end
  end

  def parse_translation_response(response)
    result = JSON.parse(response.body)
    result['translations'].first['text'] if result['translations'].any?
  end
end
