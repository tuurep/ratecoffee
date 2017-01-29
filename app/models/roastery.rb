class Roastery < ActiveRecord::Base
  has_many :coffees, dependent: :destroy
  has_many :ratings, through: :coffees

  # Moved to module
  #def average_rating
  #  self.ratings.average(:score)
  #end
  include RatingAverage
end
