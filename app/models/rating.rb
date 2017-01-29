class Rating < ActiveRecord::Base
  belongs_to :coffee

  def to_s
    self.coffee.name + " #{self.score}"
  end

end
