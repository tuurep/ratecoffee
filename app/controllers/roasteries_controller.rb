class RoasteriesController < ApplicationController
  before_action :set_roastery, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate, only: [:destroy]

  # GET /roasteries
  # GET /roasteries.json
  def index
    @roasteries = Roastery.all
  end

  # GET /roasteries/1
  # GET /roasteries/1.json
  def show
  end

  # GET /roasteries/new
  def new
    @roastery = Roastery.new
  end

  # GET /roasteries/1/edit
  def edit
  end

  # POST /roasteries
  # POST /roasteries.json
  def create
    @roastery = Roastery.new(roastery_params)

    respond_to do |format|
      if @roastery.save
        format.html { redirect_to @roastery, notice: 'Roastery was successfully created.' }
        format.json { render :show, status: :created, location: @roastery }
      else
        format.html { render :new }
        format.json { render json: @roastery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /roasteries/1
  # PATCH/PUT /roasteries/1.json
  def update
    respond_to do |format|
      if @roastery.update(roastery_params)
        format.html { redirect_to @roastery, notice: 'Roastery was successfully updated.' }
        format.json { render :show, status: :ok, location: @roastery }
      else
        format.html { render :edit }
        format.json { render json: @roastery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roasteries/1
  # DELETE /roasteries/1.json
  def destroy
    @roastery.destroy
    respond_to do |format|
      format.html { redirect_to roasteries_url, notice: 'Roastery was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_roastery
      @roastery = Roastery.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def roastery_params
      params.require(:roastery).permit(:name, :year)
    end

    def authenticate
      admin_accounts = { "admin" => "secret", "tuure" => "tuutti", "emlai" => "zenithmusicpro", "fam95" => "thicc" }

      authenticate_or_request_with_http_basic do |username, password|
        # Kovakoodataan käyttäjätunnus ja salasana
        # username == "admin" and password == "secret"
        password == admin_accounts[username]
      end
    end
end
