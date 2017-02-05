class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :coffee_club
end
