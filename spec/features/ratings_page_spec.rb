require 'rails_helper'

include Helpers

describe "Rating" do
  let!(:roastery) { FactoryGirl.create :roastery, name:"Paulig" }
  let!(:coffee1) { FactoryGirl.create :coffee, name:"iso kuppi", roastery:roastery }
  let!(:coffee2) { FactoryGirl.create :coffee, name:"Sonni", roastery:roastery }
  let!(:user) { FactoryGirl.create :user }

  before :each do
    sign_in(username:"Pekka", password:"Foobar1")
  end

  it "when given, is registered to the coffee and user who is signed in" do
    visit new_rating_path
    select('iso kuppi', from:'rating[coffee_id]')
    fill_in('rating[score]', with:'15')

    expect{
      click_button "Create Rating"
    }.to change{Rating.count}.from(0).to(1)

    expect(user.ratings.count).to eq(1)
    expect(coffee1.ratings.count).to eq(1)
    expect(coffee1.average_rating).to eq(15.0)
  end

  describe "when several exist" do
    before :each do
      create_coffees_with_ratings(FactoryGirl.create(:roastery), "hell", user, 10, 7, 9)
      visit ratings_path
    end

    it "all are shown at ratings page" do
      expect(page).to have_content "Kahvi 10 #{user.username}"
      expect(page).to have_content "Kahvi 7 #{user.username}"
      expect(page).to have_content "Kahvi 9 #{user.username}"
    end

    it "their count is shown at ratings page" do
      expect(page).to have_content "Number of ratings: #{Rating.count}"
    end

  end
end
