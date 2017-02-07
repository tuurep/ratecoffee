class Membership < ActiveRecord::Base
  belongs_to :coffee_club
  belongs_to :user
end
