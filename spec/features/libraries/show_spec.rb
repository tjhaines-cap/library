require 'rails_helper'

RSpec.describe 'library show page' do
    it 'displays library name' do
        library = Library.create!(name: "Arapahoe", branch_num: 1, city: "Centennial", open: true)
        visit "/libraries/#{library.id}"

        expect(page).to have_content(library.name)
    end

    it 'displays library branch number' do
        library = Library.create!(name: "Arapahoe", branch_num: 1, city: "Centennial", open: true)
        visit "/libraries/#{library.id}"

        expect(page).to have_content("Branch number: #{library.branch_num}")
    end

    it 'displays library city name' do
        library = Library.create!(name: "Arapahoe", branch_num: 1, city: "Centennial", open: true)
        visit "/libraries/#{library.id}"

        expect(page).to have_content("City: #{library.city}")
    end

    it 'displays library open' do
        library = Library.create!(name: "Arapahoe", branch_num: 1, city: "Centennial", open: true)
        visit "/libraries/#{library.id}"

        expect(page).to have_content("We are open")
    end

    it 'displays library closed' do
        library = Library.create!(name: "Arapahoe", branch_num: 1, city: "Centennial", open: false)
        visit "/libraries/#{library.id}"
        
        expect(page).to have_content("We are closed")
    end

    it 'displays count of books in library' do
        sheridan = Library.create!(name: "Sheridan", branch_num: 3, city: "Denver", open: false)
        sheridan.books.create!(title: "Pride and Prejudice", author: "Jane Austen", copyright: 1813, available: true)
        sheridan.books.create!(title: "The Pilgrim's Progress From This World To That Which Is To Come", author: "John Bunyan", copyright: 1678, available: false)
        sheridan.books.create!(title: "Alice's Adventures in Wonderland", author: "Lewis Carroll", copyright: 1865, available: false)
        sheridan.books.create!(title: "Twenty Thousand Leagues Under the Sea", author: "Jules Verne", copyright: 1870, available: false)
       
        visit "/libraries/#{sheridan.id}"

        expect(page).to have_content("We have 4 books")
    end
end