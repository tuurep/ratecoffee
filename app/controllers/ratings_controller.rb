class RatingsController < ApplicationController
  def index
    @ratings = Rating.all
  end

  def new
    @rating = Rating.new
    @coffees = Coffee.all
  end

  def create
    @rating = Rating.new params.require(:rating).permit(:score, :coffee_id)

    if @rating.save
      current_user.ratings << @rating
      redirect_to user_path current_user
    else
      @coffees = Coffee.all
      render :new
    end
  end

  def destroy
    rating = Rating.find(params[:id])
    rating.delete if current_user == rating.user
    redirect_to :back
  end

end
