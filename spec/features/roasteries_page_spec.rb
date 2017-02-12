require 'rails_helper'

describe "Roasteries page" do

  it "should not have any before been created" do
    visit roasteries_path
    expect(page).to have_content 'Listing roasteries'
    expect(page).to have_content 'Number of roasteries: 0'
  end

  describe "when roasteries exists" do
    before :each do
      @roasteries = ["Paulig", "Kahvimo", "Kohvik"]
      year = 1980
      @roasteries.each do |roastery_name|
        FactoryGirl.create(:roastery, name: roastery_name, year: year += 1)
      end

      visit roasteries_path
    end

    it "lists the roasteries and their total number" do
      expect(page).to have_content "Number of roasteries: #{@roasteries.count}"
      @roasteries.each do |roastery_name|
        expect(page).to have_content roastery_name
      end
    end

    it "allows user to navigate to page of a Roastery" do
      click_link "Paulig"

      expect(page).to have_content "Paulig"
      expect(page).to have_content "Established in 1981"
    end
  end
end
