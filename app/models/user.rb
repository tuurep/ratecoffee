class User < ActiveRecord::Base
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

  include RatingAverage
end
