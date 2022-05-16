require 'rails_helper'

RSpec.describe 'library index page', type: :feature do
    it 'displays name of each library in the system' do
        library = Library.create!(name: "Koelbel", branch_num: 1, city: "Centennial", open: true)
        library2 = Library.create!(name: "Sheridan", branch_num: 2, city: "Denver", open: false)
        visit "/libraries"

        expect(page).to have_content("#{library.name} created: #{library.created_at}")
        expect(page).to have_content("#{library2.name} created: #{library2.created_at}")
    end

    it 'has link to books index page' do
        visit "/libraries"

        click_on "View all books"

        expect(current_path).to eq("/books")
    end

    
end