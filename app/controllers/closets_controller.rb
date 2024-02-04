class ClosetsController < ApplicationController
  before_action :set_closet, only: %i[show edit update destroy ]
  before_action :set_categories_and_subcategories, only: [:new, :edit]

  require "base64"
  require "google/cloud/vision/v1"
  
  # GET /closets or /closets.json
  def index
    if user_signed_in?
      @user = current_user
      @closets = @user.closets
    else
      redirect_to new_user_session_path, alert: 'ログインが必要です'
    end
  end

  # GET /closets/1 or /closets/1.json
  def show
  end

  # GET /closets/new
  def new
    @closet = Closet.new
  end

  # GET /closets/1/edit
  def edit
  end

  def create
    uploaded_image = params[:closet][:image]
  
    if uploaded_image.nil?
      flash[:alert] = "画像がありません。"
      redirect_to new_closet_path
      return
    end
  
    begin
      image_path = uploaded_image.tempfile.path
      image_content = Base64.strict_encode64(File.binread(image_path))
      response = @image_annotator.label_detection(image: { content: image_content })
      labels = response.responses[0].label_annotations
      clothing_name = labels.first.description if labels.any?
    rescue => e
      flash[:alert] = "画像の分析に失敗しました。エラー: #{e.message}"
      redirect_to new_closet_path
      return
    end
  
    @closet = current_user.closets.new(closet_params)
    @closet.name = clothing_name if clothing_name.present?
  
    if @closet.save
      redirect_to closet_url(@closet), notice: "Closet was successfully created."
    else
      @categories = Category.all
      @subcategories = Subcategory.all
      render :new, status: :unprocessable_entity
    end
  end
  

  def update
    respond_to do |format|
      update_params = params[:closet][:image].present? ? closet_params : closet_params.except(:image)

      if @closet.update(update_params)
        format.html { redirect_to closet_url(@closet), notice: "Closet was successfully updated." }
        format.json { render :show, status: :ok, location: @closet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @closet.errors, status: :unprocessable_entity }
      end
    end
  end



  # DELETE /closets/1 or /closets/1.json
  def destroy
    @closet.destroy!

    respond_to do |format|
      format.html { redirect_to closets_url, notice: "Closet was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def subcategories_for_category
    category_id = params[:category_id]
    subcategories = Subcategory.where(category_id: category_id)
    render json: subcategories
  end

  def analyze_image
    uploaded_image = params[:image]
  
    if uploaded_image.nil?
      render json: { error: "Image parameter is missing." }, status: :bad_request
      return
    end
  
    begin
      image_path = uploaded_image.tempfile.path
      image_content = Base64.strict_encode64(File.binread(image_path))
      response = @image_annotator.label_detection(image: { content: image_content })
      labels = response.responses[0].label_annotations
      highest_confidence_label = labels.max_by(&:score)
    rescue => e
      render json: { error: "Failed to analyze the image. Error: #{e.message}" }, status: :unprocessable_entity
      return
    end
  
    if highest_confidence_label.present?
      render json: { name: highest_confidence_label.description }
    else
      render json: { error: "No labels detected." }, status: :ok
    end
  end
  
  
  
  private

  def set_closet
    @closet = Closet.find(params[:id])
  end

  def closet_params
    params.require(:closet).permit(:name, :category_id, :subcategory_id, :purchase_date, :size, :color, :purchase_location, :price, :usage_frequency, :season, :other_comments, :image)
  end

  def set_categories_and_subcategories
    @categories = Category.all
    @subcategories = Subcategory.all
  end

  def initialize_image_annotator
    require "google/cloud/vision/v1"
    @image_annotator = Google::Cloud::Vision::V1::ImageAnnotator::Client.new
  end
end