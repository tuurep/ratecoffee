require 'rails_helper'

describe "Coffee" do
  let!(:roastery) { FactoryGirl.create :roastery, name:"Paulig" }

  it "when given valid name, is added to the system" do
    visit new_coffee_path
    fill_in('coffee[name]', with:'Brian Coffee')

    expect{
      click_button "Create Coffee"
    }.to change{Coffee.count}.from(0).to(1)
  end

  it "when given invalid name, is not added to the system" do
    visit new_coffee_path
    fill_in('coffee[name]', with:'')

    click_button "Create Coffee"

    expect(Coffee.count).to eq(0)
  end

end
