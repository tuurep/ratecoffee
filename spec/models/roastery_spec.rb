require 'rails_helper'

RSpec.describe Roastery, type: :model do

  describe "when initialized with name Kahvenkerla and year 1674" do
    subject{ Roastery.create name: "Kahvenkerla", year: 1674 }

    it { should be_valid }
    its(:name) { should eq("Kahvenkerla") }
    its(:year) { should eq(1674) }
  end

end
