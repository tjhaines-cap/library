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
        expect(page).to not_have_content(@book2.title)
    end
end