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

end

describe "Ratings page" do

  it "should not have any before been created" do
    visit ratings_path
    expect(page).to have_content 'List of ratings'
    expect(page).to have_content 'Number of ratings: 0'
  end

  describe "when ratings exists" do
    let!(:user) { FactoryGirl.create :user }
    let!(:roastery) { FactoryGirl.create :roastery, name:"Paulig" }
    let!(:coffee) { FactoryGirl.create :coffee, name:"iso kuppi", roastery:roastery }

    before :each do
      @ratings = [10, 20, 30]
      @ratings.each do |score|
        FactoryGirl.create(:rating, user: user, score: score, coffee: coffee)
      end

      visit ratings_path
    end

    it "lists the ratings and their total number" do
      expect(page).to have_content "Number of ratings: #{@ratings.count}"
      @ratings.each do |score|
        expect(page).to have_content score
      end
    end

  end
end
