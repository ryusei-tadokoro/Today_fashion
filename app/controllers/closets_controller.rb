class ClosetsController < ApplicationController
  before_action :set_closet, only: %i[ show edit update destroy ]

  # GET /closets or /closets.json
  def index
    @closets = Closet.all
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
    @closet = Closet.new(closet_params)

    respond_to do |format|
      if @closet.save
        format.html { redirect_to closet_url(@closet), notice: "Closet was successfully created." }
        format.json { render :show, status: :created, location: @closet }
      else
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_closet
      @closet = Closet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def closet_params
      params.require(:closet).permit(:name, :category_id, :subcategory_id, :purchase_date, :size, :color, :purchase_location, :price, :usage_frequency, :season, :other_comments, :image)
    end
end
