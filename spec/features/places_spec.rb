require 'rails_helper'

describe "Places" do
  it "if one is returned by the API, it is shown at the page" do
    allow(CoffeemappingApi).to receive(:places_in).with("kumpula").and_return(
      [ Place.new( name:"Kahvikorpi", id: 1 ) ]
    )

    visit places_path
    fill_in('city', with: 'kumpula')
    click_button "Search"

    expect(page).to have_content "Kahvikorpi"
  end

  it "if multiple are returned by the API, are shown at the page" do
    allow(CoffeemappingApi).to receive(:places_in).with("kumpula").and_return(
      [ Place.new( name:"Kahvikorpi", id: 1 ),
        Place.new( name:"Kahvitaivas", id: 2 ),
        Place.new( name: "Kahvihelvetti", id: 3) ]
    )

    visit places_path
    fill_in('city', with: 'kumpula')
    click_button "Search"

    expect(page).to have_content "Kahvikorpi"
    expect(page).to have_content "Kahvitaivas"
    expect(page).to have_content "Kahvihelvetti"
  end

  it "if none are returned by the API, shows notice at the page" do
    allow(CoffeemappingApi).to receive(:places_in).with("kumpula").and_return(
      []
    )

    visit places_path
    fill_in('city', with: 'kumpula')
    click_button "Search"

    expect(page).to have_content "No locations in kumpula"
  end

end
