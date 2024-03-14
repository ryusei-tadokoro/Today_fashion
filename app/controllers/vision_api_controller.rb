# frozen_string_literal: true

class VisionApiController < ApplicationController
  require 'google/cloud/vision/v1'

  def upload
    image = params[:image].path
    image_annotator_client = Google::Cloud::Vision::V1::ImageAnnotator::Client.new
    response = image_annotator_client.label_detection(image: image)

    if response.responses.any? && response.responses.first.label_annotations.any?
      first_label = response.responses.first.label_annotations.first.description
      @label_data = { name: first_label }
    end

    respond_to do |format|
      format.json { render json: @label_data }
    end
  end
end
