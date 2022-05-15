# User Story 12, Parent Update 

# As a visitor
# When I visit a parent show page
# Then I see a link to update the parent "Update Parent"
# When I click the link "Update Parent"
# Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/parents/:id',
# the parent's info is updated,
# and I am redirected to the Parent's Show page where I see the parent's updated info

require 'rails_helper'

RSpec.describe 'Library update' do
    it 'has link to library edit page' do
        koelbel = Library.create!(name: "Koelbel", branch_num: 1, city: "Centennial", open: true)
        visit '/libraries' 
        
        click_link("Update #{koelbel.name} Library")

        expect(current_path).to eq("/libraries/#{koelbel.id}/edit")
    end

    it 'can edit library' do
        koelbel = Library.create!(name: "Koelbe", branch_num: 1, city: "Centenial", open: true)
        visit "/libraries"
        expect(page).to have_content("Koelbe")

        click_link "Update #{koelbel.name} Library"
        fill_in "name", with: "Koelbel"
        fill_in "branch_num", with: 2
        fill_in "city", with: "Centennial"
        fill_in "open", with: false
        click_button "Update Library"

        expect(current_path).to eq("/libraries/#{koelbel.id}")
        expect(page).to have_content("Koelbel")
        expect(page).to have_content("2")
        expect(page).to have_content("Centennial")
        expect(page).to have_content("We are closed")
    end
end