require 'rails_helper'

RSpec.describe 'search', type: :feature do
  describe 'I can select nations to view their members' do
    it "I can select Fire Nation and can see the associated information " do 
      # As a user,
      # When I visit "/"
      visit root_path
      
      # And I Select "Fire Nation" from the select field
      # (Note: Use the existing select field)
      # And I click "Search For Members"
      select('Fire Nation', from: :nation)
      click_button('Search For Members')
  
      # Then I should be on page "/search"
      expect(current_path).to eq(search_path)

      # Then I should see the total number of people who live in the Fire Nation. (should be close to 100)
      expect(page).to have_content("Population: 100")
      expect(page).to have_css('.community', count: 100)

      # And I should see a list with the detailed information for the first 25 members of the Fire Nation.
      # And for each of the members I should see:
      # - The name of the member (and their photo, if they have one)
      # - The list of allies or "None"
      # - The list of enemies or "None"
      # - Any affiliations that the member has
      within(first('.community')) do
        expect(page).to have_css('.name')
        expect(page).to have_css('.allies')
        expect(page).to have_css('.enemies')
        expect(page).to have_css('.affiliations')
      end

    end
  end
end