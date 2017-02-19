class Coffee < ActiveRecord::Base
  include RatingAverage

  belongs_to :roastery
  has_many :ratings, dependent: :destroy
  has_many :raters, through: :ratings, source: :user
  validates :name, length: { minimum: 1 }
  validates :style, length: { minimum: 1 }

  def to_s
    self.name + " by " + self.roastery.name
  end

  def average
    return 0 if ratings.empty?
    ratings.map{ |r| r.score }.sum / ratings.count.to_f
  end

end
