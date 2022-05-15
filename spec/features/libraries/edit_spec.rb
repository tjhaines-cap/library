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
end