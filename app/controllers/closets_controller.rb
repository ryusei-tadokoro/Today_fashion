class ClosetsController < ApplicationController
  before_action :set_closet, only: %i[show edit update destroy]
  before_action :set_categories_and_subcategories, only: %i[new_step1 new_step2 edit]
  before_action :authenticate_user!
  after_action :verify_authorized, except: %i[index subcategories_for_category]
  after_action :verify_policy_scoped, only: :index

  def index
    if user_signed_in?
      @user = current_user
      @closets = policy_scope(@user.closets)
    else
      redirect_to new_user_session_path, alert: I18n.t('alerts.login_required')
    end
  end

  def show
    authorize @closet
  end

  def new_step1
    @closet = Closet.new
    authorize @closet
    render 'closets/new_step1'
  end

  def new_step2
    @closet = Closet.new(session[:closet_step1])
    authorize @closet
    render 'closets/new_step2'
  end

  def create_step
    set_categories_and_subcategories
    Rails.logger.debug "Step: #{params[:step]}"
    Rails.logger.debug "Closet Params: #{closet_params.inspect}"
  
    case params[:step]
    when 'step1'
      @closet = Closet.new(closet_params)
      @closet.user = current_user
      authorize @closet, :create_step?
      if @closet.valid?
        session[:closet_step1] = closet_params
        redirect_to new_step2_closets_path
      else
        Rails.logger.debug "Errors: #{@closet.errors.full_messages}"
        render 'closets/new_step1'
      end
    when 'step2'
      Rails.logger.debug "Session Closet Params: #{session[:closet_step1].inspect}"
      @closet = current_user.closets.new(session[:closet_step1].merge(closet_params))
      authorize @closet, :create_step?
      if @closet.save
        session.delete(:closet_step1)
        redirect_to @closet, notice: 'Closet was successfully created.'
      else
        Rails.logger.debug "Errors: #{@closet.errors.full_messages}"
        render 'closets/new_step2'
      end
    end
  end  

  def edit
    authorize @closet
  end

  def update
    authorize @closet
    update_params = closet_update_params
    if @closet.update(update_params)
      redirect_to closet_url(@closet), notice: t('.success')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @closet
    @closet.destroy
    redirect_to closets_url, notice: t('.success')
  end

  def subcategories_for_category
    category_id = params[:category_id]
    @category = Category.find(category_id)
    authorize @category, :show?
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
