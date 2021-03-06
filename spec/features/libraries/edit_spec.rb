require 'rails_helper'

RSpec.describe 'Library update', type: :feature do

    it 'can edit library' do
        koelbel = Library.create!(name: "Smoky Hill", branch_num: 1, city: "Arapahoe", open: true)
        visit "/libraries"
        expect(page).to have_content("Smoky Hill")

        click_link "Update #{koelbel.name} Library"
        fill_in "name", with: "Koelbel"
        fill_in "branch_num", with: 2
        fill_in "city", with: "Centennial"
        select("false", from: "open")
        click_button "Update Library"

        expect(current_path).to eq("/libraries/#{koelbel.id}")
        expect(page).to have_content("Koelbel")
        expect(page).to have_content("2")
        expect(page).to have_content("Centennial")
        expect(page).to have_content("We are closed")
    end
    
end