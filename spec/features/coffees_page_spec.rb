require 'rails_helper'

describe "Coffee" do
  before :each do
    FactoryGirl.create :user
    FactoryGirl.create :roastery, name: "Niceplace"
    sign_in(username:"Pekka", password:"Foobar1")
    visit new_coffee_path
  end

  let!(:roastery) { FactoryGirl.create :roastery, name:"Paulig" }

  it "when given valid name, is added to the system" do
    fill_in('coffee_name', with:'Brain Coffee')

    expect{
      click_button "Create Coffee"
    }.to change{Coffee.count}.from(0).to(1)
  end

  it "when given invalid name, is not added to the system" do
    expect{
      click_button('Create Coffee')
    }.to change{Coffee.count}.by(0)
  end

end
