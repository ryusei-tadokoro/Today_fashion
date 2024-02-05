# frozen_string_literal: true

require 'google/cloud/vision/v1'

# Google Cloud Vision API のクライアントを初期化
image_annotator = Google::Cloud::Vision::V1::ImageAnnotator::Client.new

# 画像ファイルへのパス
file_path = 'sanga.jpg'

# コード内の「labelAnnotations」を「label_annotations」に修正
response = image_annotator.label_detection(image: file_path)

# 最初のレスポンスから最初に抽出されたラベルのテキストを直接表示
if response.responses.any? && response.responses.first.label_annotations.any?
  first_label = response.responses.first.label_annotations.first
  puts "名前: #{first_label.description}"
end
