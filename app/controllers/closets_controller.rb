class ClosetsController < ApplicationController
  before_action :set_closet, only: %i[show edit update destroy ]
  before_action :set_categories_and_subcategories, only: [:new, :edit]
  # GET /closets or /closets.json
  def index
    if user_signed_in?
      @closets = current_user.closets
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

  # POST /closets or /closets.json
  def create
    @closet = current_user.closets.new(closet_params)
  
    respond_to do |format|
      if @closet.save
        format.html { redirect_to closet_url(@closet), notice: "Closet was successfully created." }
        format.json { render :show, status: :created, location: @closet }
      else
        @categories = Category.all
        @subcategories = Subcategory.all
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @closet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /closets/1 or /closets/1.json
  def update
    respond_to do |format|
      if @closet.update(closet_params)
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

end
