require 'rails_helper'

RSpec.describe 'books show page' do
    before :each do
        @koelbel = Library.create!(name: "Koelbel", branch_num: 1, city: "Centennial", open: true)
        @book1 = @koelbel.books.create!(title: "Leaves of Grass", author: "Walt Whitman", copyright: 1855, available: true)
        @book2 = @koelbel.books.create!(title: "The Sea-Wolf", author: "Jack London", copyright: 1904, available: true) 
    end

    it 'displays book title' do
        visit "/books/#{@book1.id}"

        expect(page).to have_content(@book1.title)
        expect(page).to have_no_content(@book2.title)
    end

    it 'displays book author' do
        visit "/books/#{@book1.id}"

        expect(page).to have_content("Author: #{@book1.author}")
        expect(page).to have_no_content("Author: #{@book2.author}")
    end

    it 'displays book copyright year' do
        visit "/books/#{@book1.id}"

        expect(page).to have_content("Copyright: #{@book1.copyright}")
        expect(page).to have_no_content("Copyright: #{@book2.copyright}")
    end

    it 'displays if the book is available or not' do
        visit "/books/#{@book1.id}"

        expect(page).to have_content("Available: Yes")
        expect(page).to have_no_content("Available: No")
    end

    it 'displays the book id, created_at, and updated_at' do
        visit "/books/#{@book1.id}"

        expect(page).to have_content("ID: #{@book1.id}")
        expect(page).to have_no_content("ID: #{@book2.id}")
        expect(page).to have_content("Created: #{@book1.created_at}")
        expect(page).to have_content("Updated: #{@book1.updated_at}")
    end

end