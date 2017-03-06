# For heroku and travis
require 'coffeemapping_api'

class PlacesController < ApplicationController
  def index
  end

  def show
    @place = CoffeemappingApi.place_details(params[:id])
  end

  def search
    @places = CoffeemappingApi.places_in(params[:city])
    if @places.empty?
      redirect_to places_path, notice: "No locations in #{params[:city]}"
    else
      render :index
    end
  end

end
