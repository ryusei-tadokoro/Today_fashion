# frozen_string_literal: true

class ImageUploader < CarrierWave::Uploader::Base
  storage :fog

  if Rails.env.local?
    storage :file
  else
    storage :fog
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    if model.is_a?(Closet)
      'sample.png'
    else
      'default_image.png'
    end
  end
end
