# frozen_string_literal: true

# ClosetsController handles the CRUD operations for the Closet model.
# It ensures that users can create, read, update, and delete their closet items.
class ClosetsController < ApplicationController
  before_action :set_closet, only: %i[show edit update destroy]
  before_action :set_categories_and_subcategories, only: %i[new edit create update]
  before_action :authenticate_user!
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index

  # GET /closets or /closets.json
  def index
    if user_signed_in?
      @user = current_user
      @closets = policy_scope(@user.closets)
    else
      redirect_to new_user_session_path, alert: I18n.t('alerts.login_required')
    end
  end

  # GET /closets/1 or /closets/1.json
  def show
    authorize @closet
  end

  # GET /closets/new
  def new
    @closet = Closet.new
    authorize @closet
  end

  # GET /closets/1/edit
  def edit
    authorize @closet
  end

  # POST /closets or /closets.json
  def create
    @closet = current_user.closets.new(closet_params)
    authorize @closet
    respond_to_create(@closet)
  end

  # PATCH/PUT /closets/1 or /closets/1.json
  def update
    authorize @closet
    if @closet.update(closet_update_params)
      redirect_to closet_url(@closet), notice: t('.success')
    else
      set_categories_and_subcategories
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /closets/1 or /closets/1.json
  def destroy
    authorize @closet
    @closet.destroy
    redirect_to closets_url, notice: t('.success')
  end

  def subcategories_for_category
    category_id = params[:category_id]
    @category = Category.find(category_id)
    authorize @category, :show?
    subcategories = Subcategory.where(category_id:)
    render json: subcategories
  end

  private

  def respond_to_create(closet)
    respond_to do |format|
      if closet.save
        format.html { redirect_to closet_url(closet), notice: t('.success') }
        format.json { render :show, status: :created, location: closet }
      else
        set_categories_and_subcategories
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: closet.errors, status: :unprocessable_entity }
      end
    end
  end

  def set_closet
    @closet = Closet.find(params[:id])
  end

  def closet_params
    params.require(:closet).permit(:name, :category_id, :subcategory_id, :purchase_date, :size, :color,
                                   :purchase_location, :price, :usage_frequency, :season, :other_comments, :image)
  end

  def closet_update_params
    params.require(:closet).permit(:name, :category_id, :subcategory_id, :color, :season, :purchase_date, :size,
                                   :purchase_location, :price, :usage_frequency, :other_comments, :image)
  end

  def set_categories_and_subcategories
    @categories = Category.all
    @subcategories = Subcategory.all
  end
end
