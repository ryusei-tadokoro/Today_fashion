# frozen_string_literal: true

require 'net/http'
require 'uri'
require 'json'

class DeeplTranslator
  API_URL = 'https://api-free.deepl.com/v2/translate'

  def initialize(text, target_lang)
    @text = text
    @target_lang = target_lang
    @api_key = Rails.application.credentials.deepl[:api_key]
  end

  def translate
    response = make_request
    parse_response(response)
  rescue StandardError => e
    log_error(e)
    nil
  end

  private

  def make_request
    uri = URI.parse(API_URL)
    request = build_request(uri)
    req_options = { use_ssl: uri.scheme == 'https' }

    Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end
  end

  def build_request(uri)
    request = Net::HTTP::Post.new(uri)
    request['Authorization'] = "DeepL-Auth-Key #{@api_key}"
    request.set_form_data(
      'text' => @text,
      'target_lang' => @target_lang
    )
    request
  end

  def parse_response(response)
    result = JSON.parse(response.body)
    result['translations'].first['text']
  end

  def log_error(error)
    Rails.logger.error("Deepl translation error: #{error.message}")
  end
end
