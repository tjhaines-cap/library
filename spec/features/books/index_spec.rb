require 'rails_helper'

RSpec.describe 'books index page' do
    it 'displays all book titles' do
        library = Library.create!(name: "Arapahoe", branch_num: 1, city: "Centennial", open: true)
        book = library.books.create!(title: "Treasure Island", author: "Robert Louis Stevenson", copyright: 1883, available: true)
        book2 = library.books.create!(title: "Of Mice and Men", author: "John Steinbeck", copyright: 1937, available: false)
        visit "/books"
        
        expect(page).to have_content(book.title)
        expect(page).to have_content(book2.title)
    end

    it 'displays all book authors' do
        library = Library.create!(name: "Arapahoe", branch_num: 1, city: "Centennial", open: true)
        book = library.books.create!(title: "Treasure Island", author: "Robert Louis Stevenson", copyright: 1883, available: true)
        book2 = library.books.create!(title: "Of Mice and Men", author: "John Steinbeck", copyright: 1937, available: false)
        visit "/books"
        
        expect(page).to have_content("Author: #{book.author}")
        expect(page).to have_content("Author: #{book2.author}")
    end

    it 'displays all book copyright years' do
        library = Library.create!(name: "Arapahoe", branch_num: 1, city: "Centennial", open: true)
        book = library.books.create!(title: "Treasure Island", author: "Robert Louis Stevenson", copyright: 1883, available: true)
        book2 = library.books.create!(title: "Of Mice and Men", author: "John Steinbeck", copyright: 1937, available: false)
        visit "/books"
        
        expect(page).to have_content("Copyright: #{book.copyright}")
        expect(page).to have_content("Copyright: #{book2.copyright}")
    end

    it 'displays if each book is available' do
        library = Library.create!(name: "Arapahoe", branch_num: 1, city: "Centennial", open: true)
        book = library.books.create!(title: "Treasure Island", author: "Robert Louis Stevenson", copyright: 1883, available: true)
        book2 = library.books.create!(title: "Of Mice and Men", author: "John Steinbeck", copyright: 1937, available: false)
        visit "/books"
        
        expect(page).to have_content("Available: #{book.available}")
        expect(page).to have_content("Available: #{book2.available}")
    end

   
end