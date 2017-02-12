require 'rails_helper'

RSpec.describe User, type: :model do
  it "has the username set correctly" do
    user = User.new username:"Pekka"
    expect(user.username).to eq("Pekka")
  end

  it "is not saved without a password" do
    user = User.create username:"Pekka"
    expect(user).not_to be_valid
    expect(User.count).to eq(0)
  end

  it "is not saved with a password too short" do
    user = User.create username:"Pekka", password:"kek", password_confirmation:"kek"
    expect(user).not_to be_valid
    expect(User.count).to eq(0)
  end

  it "is not saved with a password not containing numbers" do
    user = User.create username:"Pekka", password:"halleluyah", password_confirmation:"halleluyah"
    expect(user).not_to be_valid
    expect(User.count).to eq(0)
  end

  describe "with a proper password" do
   let(:user){ FactoryGirl.create(:user) }

   it "is saved" do
     expect(user).to be_valid
     expect(User.count).to eq(1)
   end

   it "and with two ratings, has the correct average rating" do
     user.ratings << FactoryGirl.create(:rating)
     user.ratings << FactoryGirl.create(:rating2)

     expect(user.ratings.count).to eq(2)
     expect(user.average_rating).to eq(15.0)
   end
 end
end
