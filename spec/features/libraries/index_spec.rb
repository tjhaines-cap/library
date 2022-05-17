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

    it 'has link to library edit page' do
        koelbel = Library.create!(name: "Koelbel", branch_num: 1, city: "Centennial", open: true)
        visit '/libraries' 
        
        click_link("Update #{koelbel.name} Library")

        expect(current_path).to eq("/libraries/#{koelbel.id}/edit")
    end

    it 'displays the libraries in the order they were created, most recent first' do
        library = Library.create!(name: "Koelbel", branch_num: 1, city: "Centennial", open: true)
        library2 = Library.create!(name: "Sheridan", branch_num: 2, city: "Denver", open: false)
        library3 = Library.create!(name: "Smoky Hill", branch_num: 5, city: "Centennial", open: true)
        
        visit "/libraries"
        
        within('#library-0') do
            expect(page).to have_content("Smoky Hill")
            expect(page).to_not have_content("Sheridan")
            expect(page).to_not have_content("Koelbel")
        end
        within('#library-1') do
            expect(page).to have_content("Sheridan")
            expect(page).to_not have_content("Koelbel")
            expect(page).to_not have_content("Smoky Hill")
        end
        within('#library-2') do
            expect(page).to have_content("Koelbel")
            expect(page).to_not have_content("Sheridan")
            expect(page).to_not have_content("Smoky Hill")
        end
    end

    
end