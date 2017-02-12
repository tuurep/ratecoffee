require 'rails_helper'

include Helpers

describe "User" do
  let(:coffee){ FactoryGirl.create(:coffee) }
  let!(:user){ FactoryGirl.create(:user) }

  it "when signed up with good credentials, is added to the system" do
    visit signup_path
    fill_in('user_username', with:'Brian')
    fill_in('user_password', with:'Secret55')
    fill_in('user_password_confirmation', with:'Secret55')

    expect{
      click_button('Create User')
    }.to change{User.count}.by(1)
  end

  it "when deletes own rating, rating is removed from system" do
    sign_in(username:"Pekka", password:"Foobar1")
    user.ratings << FactoryGirl.create(:rating, coffee: coffee)
    user.ratings << FactoryGirl.create(:rating2, coffee: coffee)

    visit user_path(user)

    page.all('a', :text => 'delete')[1].click

    expect(user.ratings.count).to eq(1)
  end

  it "has a page which shows ratings of user" do
    user.ratings << FactoryGirl.create(:rating, coffee: coffee)
    user.ratings << FactoryGirl.create(:rating2, coffee: coffee)

    visit user_path(user)

    expect(page).to have_content user.ratings.first
    expect(page).to have_content user.ratings.second
  end

  describe "who has signed up" do
    it "can signin with right credentials" do
      sign_in(username:"Pekka", password:"Foobar1")

      expect(page).to have_content 'Welcome back!'
      expect(page).to have_content 'Pekka'
    end

    it "is redirected back to signin form if wrong credentials given" do
      sign_in(username:"Pekka", password:"wrong")

      expect(current_path).to eq(signin_path)
      expect(page).to have_content 'Invalid username and/or password!'
    end

  end
end
