class FavoriteNumbersController < ApplicationController
  before_action :set_favorite_number, only: [:show, :edit, :update, :destroy]

  # GET /favorite_numbers
  # GET /favorite_numbers.json
  def index
    @favorite_numbers = FavoriteNumber.all
  end

  # GET /favorite_numbers/1
  # GET /favorite_numbers/1.json
  def show
  end

  # GET /favorite_numbers/new
  def new
    @favorite_number = FavoriteNumber.new
  end

  # GET /favorite_numbers/1/edit
  def edit
  end

  # POST /favorite_numbers
  # POST /favorite_numbers.json
  def create
    @favorite_number = FavoriteNumber.new(favorite_number_params)

    respond_to do |format|
      if @favorite_number.save
        format.html { redirect_to @favorite_number, notice: 'Favorite number was successfully created.' }
        format.json { render :show, status: :created, location: @favorite_number }
      else
        format.html { render :new }
        format.json { render json: @favorite_number.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /favorite_numbers/1
  # PATCH/PUT /favorite_numbers/1.json
  def update
    respond_to do |format|
      if @favorite_number.update(favorite_number_params)
        format.html { redirect_to @favorite_number, notice: 'Favorite number was successfully updated.' }
        format.json { render :show, status: :ok, location: @favorite_number }
      else
        format.html { render :edit }
        format.json { render json: @favorite_number.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favorite_numbers/1
  # DELETE /favorite_numbers/1.json
  def destroy
    @favorite_number.destroy
    respond_to do |format|
      format.html { redirect_to favorite_numbers_url, notice: 'Favorite number was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite_number
      @favorite_number = FavoriteNumber.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def favorite_number_params
      params.require(:favorite_number).permit(:user_id, :num1, :num2, :num3, :num4, :num5, :num6, :num7)
    end
end
