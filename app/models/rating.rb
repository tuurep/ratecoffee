class Rating < ActiveRecord::Base
  belongs_to :coffee
  belongs_to :user

  def to_s
    self.coffee.name + " #{self.score}"
  end

end
