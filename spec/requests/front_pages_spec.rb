require 'spec_helper'

describe "Front Pages" do

  describe "Home Page" do

    it "should have the content 'Maestro'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit '/front_pages/home'
      expect(page).to have_content('Maestro')
    end
  end

  describe "Help Page" do

    it "should have thecontent 'Help'" do
      visit '/front_pages/help'
      expect(page).to have_content('Help')
    end
  end
end
