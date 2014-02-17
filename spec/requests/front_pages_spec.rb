require 'spec_helper'

describe "Front Pages" do

  describe "Home Page" do

    it "should have the content 'Maestro'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit root_path
      expect(page).to have_content('Maestro')
    end
  end

  describe "Help Page" do

    it "should have thecontent 'Help'" do
      visit help_path
      expect(page).to have_content('Help')
    end
  end
end
