module RatingAverage
  def average_rating
    return nil if ratings.empty?
    self.ratings.average(:score)
  end
end
