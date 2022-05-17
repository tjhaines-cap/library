require 'rails_helper'

RSpec.describe Book, type: :model do

    describe 'validations' do
        it { should validate_presence_of :title }
        it { should validate_presence_of :author }
        it { should validate_presence_of :copyright }
        it { should allow_value(true).for(:available) }
        it { should allow_value(false).for(:available) }
    end

    describe 'relationships' do
        it { should belong_to :library }
    end

    describe 'available' do
        it 'returns only books with available = true' do
            koelbel = Library.create!(name: "Koelbel", branch_num: 1, city: "Centennial", open: true)
            book1 = koelbel.books.create!(title: "Leaves of Grass", author: "Walt Whitman", copyright: 1855, available: true)
            book2 = koelbel.books.create!(title: "The Sea-Wolf", author: "Jack London", copyright: 1904, available: true)
            book3 = koelbel.books.create!(title: "Dune", author: "Frank Herbert", copyright: 1965, available: false)
            book4 = koelbel.books.create!(title: "Treasure Island", author: "Robert Louis Stevenson", copyright: 1883, available: true)

            available_books = Book.available
            expect(available_books).to eq([book1, book2, book4])
        end
    end

    describe 'order by title' do
        it 'returns the books in order alphabetically' do 
            koelbel = Library.create!(name: "Koelbel", branch_num: 1, city: "Centennial", open: true)
            book1 = koelbel.books.create!(title: "Leaves of Grass", author: "Walt Whitman", copyright: 1855, available: true)
            book2 = koelbel.books.create!(title: "The Sea-Wolf", author: "Jack London", copyright: 1904, available: true)
            book3 = koelbel.books.create!(title: "Dune", author: "Frank Herbert", copyright: 1965, available: false)
            book4 = koelbel.books.create!(title: "Treasure Island", author: "Robert Louis Stevenson", copyright: 1883, available: true)

            orderd_books = Book.order_by_title
            expect(ordered_books).to eq([book3, book1, book2, book4])
        end
    end

end