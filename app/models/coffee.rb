class Coffee < ActiveRecord::Base
  belongs_to :roastery
  has_many :ratings, dependent: :destroy
  has_many :raters, through: :ratings, source: :user

  validates :score, numericality: { greater_than_or_equal_to: 1,
                                    less_than_or_equal_to: 50,
                                    only_integer: true }
  validates :name, length: { minimum: 1 }


  include RatingAverage

  def to_s
    self.name + " by " + self.roastery.name
  end

  def average
    return 0 if ratings.empty?
    ratings.map{ |r| r.score }.sum / ratings.count.to_f
  end

end
