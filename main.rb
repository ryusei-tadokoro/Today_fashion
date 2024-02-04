require 'google/cloud/vision/v1'

# Google Cloud Vision API のクライアントを初期化
image_annotator = Google::Cloud::Vision::V1::ImageAnnotator::Client.new

# 画像ファイルへのパス
file_path = 'sanga.jpg'

# コード内の「labelAnnotations」を「label_annotations」に修正
response = image_annotator.label_detection(image: file_path)

# 抽出されたテキストを表示
response.responses.each do |res|
  res.label_annotations.each do |label|
    puts "名前: #{label.description}"
  end
end
