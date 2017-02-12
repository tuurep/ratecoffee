require 'rails_helper'

RSpec.describe Coffee, type: :model do

  it "is saved with valid name and style" do
    coffee = Coffee.create name:"Coffy", style:"Extra Dark"
    expect(coffee).to be_valid
    expect(Coffee.count).to eq(1)
  end

  it "is not saved without name" do
    coffee = Coffee.create style:"Extra Dark"
    expect(coffee).not_to be_valid
    expect(Coffee.count).to eq(0)
  end

  it "is not saved without style" do
    coffee = Coffee.create name:"Coffy"
    expect(coffee).not_to be_valid
    expect(Coffee.count).to eq(0)
  end

end
