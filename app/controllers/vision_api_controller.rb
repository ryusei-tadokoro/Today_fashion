class VisionApiController < ApplicationController
  require 'google/cloud/vision'
  require 'net/http'
  require 'uri'
  require 'json'

  def upload
    credentials_hash = JSON.parse(Rails.application.credentials.dig(:google_cloud, :credentials))

    # Google Cloud Vision APIクライアントを初期化
    image_annotator_client = Google::Cloud::Vision.image_annotator do |config|
      config.credentials = credentials_hash
    end

    # 画像のパスを取得
    image = params[:image].path

    # 画像のラベル検出を実行
    response = image_annotator_client.label_detection(image:)

    # レスポンスから最初のラベルの説明を取得
    if response.responses.any? && response.responses.first.label_annotations.any?
      first_label = response.responses.first.label_annotations.first.description

      # 翻訳を実行
      translated_label = translate_text(first_label)

      @label_data = { translated_name: translated_label }
    end

    # JSON形式でレスポンスを返す
    respond_to do |format|
      format.json { render json: @label_data }
    end
  end

  private

  def translate_text(text)
    api_key = Rails.application.credentials.dig(:deepl, :api_key)
    url = URI.parse('https://api-free.deepl.com/v2/translate')
    request = Net::HTTP::Post.new(url.to_s)
    request['Authorization'] = "DeepL-Auth-Key #{api_key}"
    request.set_form_data({
                            'text' => text,
                            'target_lang' => 'JA'
                          })

    response = Net::HTTP.start(url.host, url.port, use_ssl: true) do |http|
      http.request(request)
    end

    result = JSON.parse(response.body)
    result['translations'].first['text'] if result['translations'].any?
  end
end
