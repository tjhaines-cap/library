require 'rails_helper'

RSpec.describe 'books index page' do
    it 'displays all books and their attributes' do
        library = Library.create!(name: "Arapahoe", branch_num: 1, city: "Centennial", open: true)
        book = library.books.create!(title: "Treasure Island", author: "Robert Louis Stevenson", copyright: 1883, available: true)
        book2 = library.books.create!(title: "Of Mice and Men", author: "John Steinbeck", copyright: 1937, available: false)
        visit "/books"
        
        expect(page).to have_content(book.title)
        expect(page).to have_content(book2.title)

    end
end