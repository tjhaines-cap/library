# User Story 14, Child Update 

# As a visitor
# When I visit a Child Show page
# Then I see a link to update that Child "Update Child"
# When I click the link
# I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
# When I click the button to submit the form "Update Child"
# Then a `PATCH` request is sent to '/child_table_name/:id',
# the child's data is updated,
# and I am redirected to the Child Show page where I see the Child's updated information

require 'rails_helper'

RSpec.describe 'Book update', type: :feature do
    it 'has link to book edit page' do
        koelbel = Library.create!(name: "Koelbel", branch_num: 1, city: "Centennial", open: true)
        dune = koelbel.books.create!(title: "Random", author: "Unknown", copyright: 1965, available: false)

        visit "/books/#{dune.id}" 
        expect(page).to have_content("Random")
        expect(page).to have_content("Unknown")
        
        click_link("Update #{dune.title}")

        expect(current_path).to eq("/books/#{dune.id}/edit")
    end

end