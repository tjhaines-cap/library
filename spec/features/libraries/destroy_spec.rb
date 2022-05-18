require 'rails_helper'

RSpec.describe 'destroying a library', type: :feature do
    
    it 'can delete the library from a link on the show page' do
        koelbel = Library.create!(name: "Koelbel", branch_num: 1, city: "Centennial", open: true)
        koelbel.books.create!(title: "Leaves of Grass", author: "Walt Whitman", copyright: 1855, available: true)
        koelbel.books.create!(title: "The Sea-Wolf", author: "Jack London", copyright: 1904, available: true)
        sheridan = Library.create!(name: "Sheridan", branch_num: 3, city: "Denver", open: false)
        sheridan.books.create!(title: "Of Mice and Men", author: "John Steinbeck", copyright: 1937, available: false)
        sheridan.books.create!(title: "Pride and Prejudice", author: "Jane Austen", copyright: 1813, available: true)

        visit "/libraries/#{koelbel.id}"
        click_link "Delete #{koelbel.name} Library"
        
        expect(current_path).to eq('/libraries')
        expect(page).to_not have_content("Koelbel")
        expect(page).to have_content("Sheridan")

        visit "/libraries/#{sheridan.id}/books"

        expect(page).to have_content("Of Mice and Men")
    end

    it 'can delete the library from a link on the index page' do
        koelbel = Library.create!(name: "Koelbel", branch_num: 1, city: "Centennial", open: true)
        koelbel.books.create!(title: "Leaves of Grass", author: "Walt Whitman", copyright: 1855, available: true)
        koelbel.books.create!(title: "The Sea-Wolf", author: "Jack London", copyright: 1904, available: true)
        sheridan = Library.create!(name: "Sheridan", branch_num: 3, city: "Denver", open: false)
        sheridan.books.create!(title: "Of Mice and Men", author: "John Steinbeck", copyright: 1937, available: false)
        sheridan.books.create!(title: "Pride and Prejudice", author: "Jane Austen", copyright: 1813, available: true)

        visit "/libraries"
        click_link "Delete #{koelbel.name} Library"
        
        expect(current_path).to eq('/libraries')
        expect(page).to_not have_content("Koelbel")
        expect(page).to have_content("Sheridan")

        visit "/libraries/#{sheridan.id}/books"

        expect(page).to have_content("Of Mice and Men")
    end

end