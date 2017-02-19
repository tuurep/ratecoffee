module Helpers

  def sign_in(credentials)
    visit signin_path
    fill_in('username', with:credentials[:username])
    fill_in('password', with:credentials[:password])
    click_button('Log in')
  end

  def create_coffee_with_ratings(roastery, style, user, score)
    coffee = FactoryGirl.create(:coffee, roastery: roastery, style: style)
    FactoryGirl.create(:rating, score: score, coffee: coffee, user: user)
    coffee
  end

  def create_coffees_with_ratings(roastery, style, user, *scores)
    scores.each do |score|
      create_coffee_with_ratings(roastery, style, user, score)
    end
  end

end
