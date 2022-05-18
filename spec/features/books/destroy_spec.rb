require 'rails_helper'

RSpec.describe 'destroy book', type: :feature do

    it 'can delete a book from a link on the book show page' do
        koelbel = Library.create!(name: "Koelbel", branch_num: 1, city: "Centennial", open: true)
        book1 = koelbel.books.create!(title: "Leaves of Grass", author: "Walt Whitman", copyright: 1855, available: true)
        book2 = koelbel.books.create!(title: "The Sea-Wolf", author: "Jack London", copyright: 1904, available: true)
        sheridan = Library.create!(name: "Sheridan", branch_num: 3, city: "Denver", open: false)
        book3 = sheridan.books.create!(title: "Of Mice and Men", author: "John Steinbeck", copyright: 1937, available: false)
        book4 = sheridan.books.create!(title: "Pride and Prejudice", author: "Jane Austen", copyright: 1813, available: true)

        visit "/books/#{book2.id}"
        click_link("Delete #{book2.title}")

        expect(current_path).to eq("/books")
        expect(page).to_not have_content("The Sea-Wolf")
        expect(page).to have_content("Leaves of Grass")
    end

    it 'can delete a book from a link on the book index page' do
        koelbel = Library.create!(name: "Koelbel", branch_num: 1, city: "Centennial", open: true)
        book1 = koelbel.books.create!(title: "Leaves of Grass", author: "Walt Whitman", copyright: 1855, available: true)
        book2 = koelbel.books.create!(title: "The Sea-Wolf", author: "Jack London", copyright: 1904, available: true)
        sheridan = Library.create!(name: "Sheridan", branch_num: 3, city: "Denver", open: false)
        book3 = sheridan.books.create!(title: "Of Mice and Men", author: "John Steinbeck", copyright: 1937, available: false)
        book4 = sheridan.books.create!(title: "Pride and Prejudice", author: "Jane Austen", copyright: 1813, available: true)

        visit "/books"
        click_link("Delete #{book2.title}")

        expect(current_path).to eq("/books")
        expect(page).to_not have_content("The Sea-Wolf")
        expect(page).to have_content("Leaves of Grass")
    end
    
    it 'can delete a book from a link on the library book index page' do
        koelbel = Library.create!(name: "Koelbel", branch_num: 1, city: "Centennial", open: true)
        book1 = koelbel.books.create!(title: "Leaves of Grass", author: "Walt Whitman", copyright: 1855, available: true)
        book2 = koelbel.books.create!(title: "The Sea-Wolf", author: "Jack London", copyright: 1904, available: true)
        sheridan = Library.create!(name: "Sheridan", branch_num: 3, city: "Denver", open: false)
        book3 = sheridan.books.create!(title: "Of Mice and Men", author: "John Steinbeck", copyright: 1937, available: false)
        book4 = sheridan.books.create!(title: "Pride and Prejudice", author: "Jane Austen", copyright: 1813, available: true)

        visit "/libraries/#{koelbel.id}/books"
        save_and_open_page
        click_link("Delete #{book2.title}")

        expect(current_path).to eq("/books")
        expect(page).to_not have_content("The Sea-Wolf")
        expect(page).to have_content("Leaves of Grass")
    end

end