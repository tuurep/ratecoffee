class Roastery < ActiveRecord::Base
  has_many :coffees, dependent: :destroy
  has_many :ratings, through: :coffees

  validates :name, length: { minimum: 1 }
  validates :year, numericality: { greater_than_or_equal_to: 1042,
                                   less_than_or_equal_to: 2017,
                                   only_integer: true }

  include RatingAverage
end
