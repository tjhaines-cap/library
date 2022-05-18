require 'rails_helper'

RSpec.describe 'books index page', type: :feature do
    it 'displays all book titles' do
        library = Library.create!(name: "Arapahoe", branch_num: 1, city: "Centennial", open: true)
        book = library.books.create!(title: "Treasure Island", author: "Robert Louis Stevenson", copyright: 1883, available: true)
        book2 = library.books.create!(title: "Of Mice and Men", author: "John Steinbeck", copyright: 1937, available: true)
        visit "/books"
        
        expect(page).to have_content(book.title)
        expect(page).to have_content(book2.title)
    end

    it 'displays all book authors' do
        library = Library.create!(name: "Arapahoe", branch_num: 1, city: "Centennial", open: true)
        book = library.books.create!(title: "Treasure Island", author: "Robert Louis Stevenson", copyright: 1883, available: true)
        book2 = library.books.create!(title: "Of Mice and Men", author: "John Steinbeck", copyright: 1937, available: true)
        visit "/books"
        
        expect(page).to have_content("Author: #{book.author}")
        expect(page).to have_content("Author: #{book2.author}")
    end

    it 'displays all book copyright years' do
        library = Library.create!(name: "Arapahoe", branch_num: 1, city: "Centennial", open: true)
        book = library.books.create!(title: "Treasure Island", author: "Robert Louis Stevenson", copyright: 1883, available: true)
        book2 = library.books.create!(title: "Of Mice and Men", author: "John Steinbeck", copyright: 1937, available: true)
        visit "/books"
        
        expect(page).to have_content("Copyright: #{book.copyright}")
        expect(page).to have_content("Copyright: #{book2.copyright}")
    end

    it 'displays if each book is available' do
        library = Library.create!(name: "Arapahoe", branch_num: 1, city: "Centennial", open: true)
        book = library.books.create!(title: "Treasure Island", author: "Robert Louis Stevenson", copyright: 1883, available: true)
        book2 = library.books.create!(title: "Of Mice and Men", author: "John Steinbeck", copyright: 1937, available: true)
        visit "/books"
       
        expect(page).to have_content("Available: #{book.available}")
        expect(page).to have_content("Available: #{book2.available}")
    end

    it 'displays id, created_at, and updated_at attributes' do
        library = Library.create!(name: "Arapahoe", branch_num: 1, city: "Centennial", open: true)
        book = library.books.create!(title: "Treasure Island", author: "Robert Louis Stevenson", copyright: 1883, available: true)
        visit "/books"

        expect(page).to have_content("ID: #{book.id}")
        expect(page).to have_content("Created: #{book.created_at}")
        expect(page).to have_content("Updated: #{book.updated_at}")
    end

    it 'has link to libraries index' do
        visit "/books"
        
        click_on "View all libraries"
        
        expect(current_path).to eq("/libraries")
    end

    it 'displays only available book' do
        library = Library.create!(name: "Arapahoe", branch_num: 1, city: "Centennial", open: true)
        book = library.books.create!(title: "Treasure Island", author: "Robert Louis Stevenson", copyright: 1883, available: true)
        book2 = library.books.create!(title: "Of Mice and Men", author: "John Steinbeck", copyright: 1937, available: false)
       
        visit "/books"

        expect(page).to have_content("Treasure Island")
        expect(page).to_not have_content("Of Mice and Men")
    end

    it 'has link to book edit page' do
        koelbel = Library.create!(name: "Koelbel", branch_num: 1, city: "Centennial", open: true)
        dune = koelbel.books.create!(title: "Random", author: "Unknown", copyright: 1965, available: false)

        visit "/books/#{dune.id}" 
        click_link("Update Book")

        expect(current_path).to eq("/books/#{dune.id}/edit")
    end

    it 'has link for each book to go to that show page' do
        sheridan = Library.create!(name: "Sheridan", branch_num: 3, city: "Denver", open: false)
        alice = sheridan.books.create!(title: "Alice's Adventures in Wonderland", author: "Lewis Carroll", copyright: 1865, available: false)
        twenty = sheridan.books.create!(title: "Twenty Thousand Leagues Under the Sea", author: "Jules Verne", copyright: 1870, available: false)
        secret = sheridan.books.create!(title: "The Secret Garden", author: "Frances Hodgson Burnett", copyright: 1987, available: true)

        visit "/books"
        click_link("View #{alice.title}")

        expect(current_path).to eq("/books/#{alice.id}")
        expect(page).to have_content("Alice's Adventures in Wonderland")
        expect(page).to have_content("Lewis Carroll")
        expect(page).to_not have_content("Twenty Thousand Leagues Under the Sea")

        visit "/books"
        click_link("View #{twenty.title}")

        expect(current_path).to eq("/books/#{twenty.id}")
        expect(page).to have_content("Twenty Thousand Leagues Under the Sea")
        expect(page).to have_content(twenty.author)
        expect(page).to_not have_content(secret.title)
        expect(page).to_not have_content(alice.title)
    end
   
end