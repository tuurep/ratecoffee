class User < ActiveRecord::Base
  include RatingAverage

  has_secure_password

  has_many :ratings, dependent: :destroy
  has_many :coffees, through: :ratings

  has_many :coffee_clubs, through: :memberships
  has_many :memberships, dependent: :destroy

  validates :username, uniqueness: true,
                       length: { minimum: 3,
                                 maximum: 30}
  validates :password, length: { minimum: 4 },
                       format: { with: /[A-Z].*\d|\d.*[A-Z]/ ,
                       message: "should contain one number and one capital letter" }

  def favorite_coffee
    return nil if ratings.empty?
    ratings.order(score: :desc).limit(1).first.coffee
  end

  def favorite_roastery
    return nil if ratings.empty?

    ratings_of_roasteries = ratings.group_by { |r| r.coffee.roastery }
    averages_of_roasteries = []
    ratings_of_roasteries.each do |roastery, ratings|
      averages_of_roasteries << {
        roastery: roastery,
        rating: ratings.map(&:score).sum / ratings.count.to_f
      }
    end
    averages_of_roasteries.sort_by{ |b| -b[:rating] }.first[:roastery]
  end

  def favorite_style
    return nil if ratings.empty?

    ratings_of_styles = ratings.group_by { |r| r.coffee.style }
    averages_of_styles = []
    ratings_of_styles.each do |style, ratings|
      averages_of_styles << {
        style: style,
        rating: ratings.map(&:score).sum / ratings.count.to_f
      }
    end
    averages_of_styles.sort_by{ |b| -b[:rating] }.first[:style]
  end

  def is_member_of?(coffee_club)
    coffee_clubs.include? coffee_club
  end

end
