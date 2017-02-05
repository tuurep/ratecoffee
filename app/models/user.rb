class User < ActiveRecord::Base
  has_secure_password
  has_many :ratings, dependent: :destroy
  has_many :coffees, through: :ratings
  has_many :coffee_clubs

  validates :username, uniqueness: true,
                       length: { minimum: 3,
                                 maximum: 30}
  validates :password, length: { minimum: 4 },
                       format: { with: /[A-Z].*\d|\d.*[A-Z]/ }

  include RatingAverage
end
