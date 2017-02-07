class CoffeeClubsController < ApplicationController
  before_action :set_coffee_club, only: [:show, :edit, :update, :destroy]

  # GET /coffee_clubs
  # GET /coffee_clubs.json
  def index
    @coffee_clubs = CoffeeClub.all
  end

  # GET /coffee_clubs/1
  # GET /coffee_clubs/1.json
  def show
  end

  # GET /coffee_clubs/new
  def new
    @coffee_club = CoffeeClub.new
  end

  # GET /coffee_clubs/1/edit
  def edit
  end

  # POST /coffee_clubs
  # POST /coffee_clubs.json
  def create
    @coffee_club = CoffeeClub.new(coffee_club_params)

    respond_to do |format|
      if @coffee_club.save
        format.html { redirect_to @coffee_club, notice: 'Coffee club was successfully created.' }
        format.json { render :show, status: :created, location: @coffee_club }
      else
        format.html { render :new }
        format.json { render json: @coffee_club.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coffee_clubs/1
  # PATCH/PUT /coffee_clubs/1.json
  def update
    respond_to do |format|
      if @coffee_club.update(coffee_club_params)
        format.html { redirect_to @coffee_club, notice: 'Coffee club was successfully updated.' }
        format.json { render :show, status: :ok, location: @coffee_club }
      else
        format.html { render :edit }
        format.json { render json: @coffee_club.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coffee_clubs/1
  # DELETE /coffee_clubs/1.json
  def destroy
    @coffee_club.destroy
    respond_to do |format|
      format.html { redirect_to coffee_clubs_url, notice: 'Coffee club was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coffee_club
      @coffee_club = CoffeeClub.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coffee_club_params
      params.require(:coffee_club).permit(:name, :founded, :city)
    end
end
