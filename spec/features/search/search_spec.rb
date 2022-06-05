require 'rails_helper'

RSpec.describe 'Search Page' do

  describe 'As a Vistore' do

    it 'When I select Turing I am taken to the /search page' do
      visit '/'

      within ".navbar-search-form" do
        
        select 'Turing', from: 'location'
        click_on "Find Nearest Station"
      end

      # save_and_open_page
      expect(current_path).to eq('/search')
    end 

    it 'has the attributes for the station' do
      visit '/'

      within ".navbar-search-form" do
        
        select 'Turing', from: 'location'
        click_on "Find Nearest Station"
      end
      save_and_open_page
      expect(page).to have_content("Name: CBRE As Agent for EQC Operating Trust")
      expect(page).to have_content("Address: 1225 17th Street, Suite 130")
      expect(page).to have_content("Fuel Type: ELEC")
      expect(page).to have_content("Access Times: MO: Not Specified; TU: Not Specified; WE: Not Specified; TH: Not Specified; FR: Not Specified; SA: Not Specified; SU: Not Specified")



    end 





  end 
end 