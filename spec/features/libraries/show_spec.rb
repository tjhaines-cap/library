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
        save_and_open_page
        expect(page).to have_content("We are closed")
    end
end