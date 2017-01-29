class CoffeesController < ApplicationController
  before_action :set_coffee, only: [:show, :edit, :update, :destroy]

  # GET /coffees
  # GET /coffees.json
  def index
    @coffees = Coffee.all
  end

  # GET /coffees/1
  # GET /coffees/1.json
  def show
  end

  # GET /coffees/new
  def new
    @coffee = Coffee.new
    @roasteries = Roastery.all
    @styles = ["Extra light", "Light", "Medium", "Dark", "Extra dark"]
  end

  # GET /coffees/1/edit
  def edit
  end

  # POST /coffees
  # POST /coffees.json
  def create
    @coffee = Coffee.new(coffee_params)

    respond_to do |format|
      if @coffee.save
        format.html { redirect_to @coffee, notice: 'Coffee was successfully created.' }
        format.json { render :show, status: :created, location: @coffee }
      else
        format.html { render :new }
        format.json { render json: @coffee.errors, status: :unprocessable_entity }
      end
    end

    redirect_to coffees_path
  end

  # PATCH/PUT /coffees/1
  # PATCH/PUT /coffees/1.json
  def update
    respond_to do |format|
      if @coffee.update(coffee_params)
        format.html { redirect_to @coffee, notice: 'Coffee was successfully updated.' }
        format.json { render :show, status: :ok, location: @coffee }
      else
        format.html { render :edit }
        format.json { render json: @coffee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coffees/1
  # DELETE /coffees/1.json
  def destroy
    @coffee.destroy
    respond_to do |format|
      format.html { redirect_to coffees_url, notice: 'Coffee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coffee
      @coffee = Coffee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coffee_params
      params.require(:coffee).permit(:name, :style, :roastery_id)
    end
end
