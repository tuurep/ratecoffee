class Coffee < ActiveRecord::Base
  belongs_to :roastery
  has_many :ratings, dependent: :destroy

  # Moved to module
  #def average_rating
  #  self.ratings.average(:score)
  #end
  include RatingAverage

  def to_s
    self.name + " by " + self.roastery.name
  end

end
