# User Story 13, Parent Child Creation 

# As a visitor
# When I visit a Parent Childs Index page
# Then I see a link to add a new adoptable child for that parent "Create Child"
# When I click the link
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed

require 'rails_helper'

RSpec.describe 'Library book creation', type: :feature do
    it 'has link to new book page from library book index page' do
        koelbel = Library.create!(name: "Koelbel", branch_num: 1, city: "Centennial", open: true)

        visit "/libraries/#{koelbel.id}/books"
        click_link "Create Book"

        expect(current_path).to eq("/libraries/#{koelbel.id}/books/new")
    end

    it 'can create a new book for the library' do
        koelbel = Library.create!(name: "Koelbel", branch_num: 1, city: "Centennial", open: true)

        visit "/libraries/#{koelbel.id}/books/new" 

        fill_in('title', with: "Treasure Island")
        fill_in('author', with: "Robert Louis Stevenson")
        fill_in('copyright', with: 1883)
        fill_in('available', with: true)
        click_button('Create Book')
        book_id = Book.last.id

        expect(current_path).to eq("/libraries/#{koelbel.id}/books")
        expect(page).to have_content("Treasure Island")
        expect(page).to have_content("Robert Louis Stevenson")
        expect(page).to have_content("1883")
        expect(page).to have_content("Available: Yes")
    end
end