class ClosetsController < ApplicationController
  before_action :set_closet, only: %i[show edit update destroy]
  before_action :set_categories_and_subcategories, only: %i[new_step1 new_step2 edit]
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

  # GET /closets/new/step1
  def new_step1
    @closet = Closet.new
    authorize @closet
    render 'new/step1'
  end

  # GET /closets/new/step2
  def new_step2
    @closet = Closet.new(closet_params)
    render 'new/step2'
  end

  # POST /closets/create/step
  def create_step
    if params[:step] == 'step1'
      @closet = Closet.new(closet_params)
      render 'new/step2'
    elsif params[:step] == 'step2'
      @closet = current_user.closets.new(closet_params)
      authorize @closet
      if @closet.save
        redirect_to @closet, notice: 'Closet was successfully created.'
      else
        render 'new/step1'
      end
    end
  end

  # GET /closets/1/edit
  def edit
    authorize @closet
  end

  # PATCH/PUT /closets/1 or /closets/1.json
  def update
    authorize @closet
    update_params = closet_update_params
    if @closet.update(update_params)
      redirect_to closet_url(@closet), notice: t('.success')
    else
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
    subcategories = Subcategory.where(category_id: category_id)
    render json: subcategories
  end

  private

  def set_closet
    @closet = Closet.find(params[:id])
  end

  def closet_params
    params.require(:closet).permit(:name, :category_id, :subcategory_id, :purchase_date, :size, :color,
                                   :purchase_location, :price, :usage_frequency, :season, :other_comments, :image)
  end

  def closet_update_params
    params.require(:closet).permit(
      :name, :category_id, :subcategory_id, :purchase_date, :size, :color,
      :purchase_location, :price, :usage_frequency, :season, :other_comments
    ).merge(image: params[:closet][:image].presence || @closet.image)
  end

  def set_categories_and_subcategories
    @categories = Category.all
    @subcategories = Subcategory.all
  end
end
