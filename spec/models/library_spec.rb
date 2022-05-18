require 'rails_helper'

RSpec.describe Library, type: :model do
    
    describe 'validations' do
        it { should validate_presence_of :name }
        it { should validate_presence_of :branch_num }
        it { should validate_presence_of :city }
        it { should allow_value(true).for(:open) }
        it { should allow_value(false).for(:open) }
    end

    describe 'relationships' do
        it { should have_many :books }
    end

    describe 'count books' do
        it 'counts the number of books in the library' do
            sheridan = Library.create!(name: "Sheridan", branch_num: 3, city: "Denver", open: false)
            sheridan.books.create!(title: "Of Mice and Men", author: "John Steinbeck", copyright: 1937, available: false)
            sheridan.books.create!(title: "Pride and Prejudice", author: "Jane Austen", copyright: 1813, available: true)
            sheridan.books.create!(title: "The Pilgrim's Progress From This World To That Which Is To Come", author: "John Bunyan", copyright: 1678, available: false)
            sheridan.books.create!(title: "Alice's Adventures in Wonderland", author: "Lewis Carroll", copyright: 1865, available: false)
            sheridan.books.create!(title: "Twenty Thousand Leagues Under the Sea", author: "Jules Verne", copyright: 1870, available: false)

            expect(sheridan.count_books).to eq(5)
        end
    end

    describe 'sort libraries by created_at with most recent at the top' do
        it 'returns the libraries sorted from most to least recently created' do
            koelbel = Library.create!(name: "Koelbel", branch_num: 1, city: "Centennial", open: true)
            sheridan = Library.create!(name: "Sheridan", branch_num: 3, city: "Denver", open: false)
            sorted_libraries = Library.order_by_recent

            expect(sorted_libraries).to eq([sheridan, koelbel])
        end
    end
end