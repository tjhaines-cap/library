require 'rails_helper'

RSpec.describe 'library show page' do
    it 'displays library name' do
        library = Library.create!(name: "Koelbel", branch_num: 1, city: "Centennial", open: true)
        visit "/libraries/#{library.id}"

        expect(page).to have_content(library.name)
    end

    it 'displays library branch number'

    it 'displays library city name'

    it 'displays library open or closed'
end