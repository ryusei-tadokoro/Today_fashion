class VisionApiController < ApplicationController
  require 'google/cloud/vision'

  def upload
    credentials_hash = JSON.parse(Rails.application.credentials.dig(:google_cloud, :credentials))

    # Google Cloud Vision APIクライアントを初期化
    image_annotator_client = Google::Cloud::Vision.image_annotator do |config|
      config.credentials = credentials_hash
    end

    # 画像のパスを取得
    image = params[:image].path

    # 画像のラベル検出を実行
    response = image_annotator_client.label_detection(image: image)

    # レスポンスから最初のラベルの説明を取得
    if response.responses.any? && response.responses.first.label_annotations.any?
      first_label = response.responses.first.label_annotations.first.description

      # Deepl翻訳機能を使用してラベルを翻訳
      translated_label = DeeplTranslator.new(first_label, 'JA').translate

      @label_data = { name: first_label, translated_name: translated_label }
    end

    # JSON形式でレスポンスを返す
    respond_to do |format|
      format.json { render json: @label_data }
    end
  end
end
