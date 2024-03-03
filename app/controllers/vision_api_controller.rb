# frozen_string_literal: true

class VisionApiController < ApplicationController
  require 'google/cloud/vision/v1'

  def upload
    set_google_cloud_env
    image = params[:image].path
    image_annotator_client = Google::Cloud::Vision.image_annotator
    response = image_annotator_client.label_detection image: image

    if response.responses.any? && response.responses.first.label_annotations.any?
      first_label = response.responses.first.label_annotations.first.description
      # 必要に応じて、さらに多くのラベルを処理することも可能
      @label_data = { name: first_label }
    end

    respond_to do |format|
      format.json { render json: @label_data }
    end
  end

  private

  def set_google_cloud_env
    @google_cloud_project = ENV.fetch('GOOGLE_CLOUD_PROJECT', nil)
    @google_cloud_keyfile = ENV.fetch('GOOGLE_VISION_API_KEY', nil)
  end  
end
