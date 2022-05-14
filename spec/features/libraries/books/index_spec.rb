require 'rails_helper'

RSpec.describe 'Library books index' do
    before :each do
        @koelbel = Library.create!(name: "Koelbel", branch_num: 1, city: "Centennial", open: true)
        @book1 = @koelbel.books.create!(title: "Leaves of Grass", author: "Walt Whitman", copyright: 1855, available: true)
        @book2 = @koelbel.books.create!(title: "The Sea-Wolf", author: "Jack London", copyright: 1904, available: false) 
    end
    
    it 'displays all the titles of the books in the library' do
        visit "/libraries/#{@koelbel.id}/books"

        expect(page).to have_content(@book1.title)
        expect(page).to have_content(@book2.title)
    end

    it 'displays all the authors of the books in the library' do
        visit "/libraries/#{@koelbel.id}/books"

        expect(page).to have_content("Author: #{@book1.author}")
        expect(page).to have_content("Author: #{@book2.author}")
    end

    it 'displays all the copyrights of the books in the library' do
        visit "/libraries/#{@koelbel.id}/books"

        expect(page).to have_content("Copyright: #{@book1.copyright}")
        expect(page).to have_content("Copyright: #{@book2.copyright}")

    end

    it 'displays if each book is available' do
        visit "/libraries/#{@koelbel.id}/books"

        expect(page).to have_content("Available: Yes")
        expect(page).to have_content("Available: No")

    end

    it 'displays id and created_at updated_at for each book' do
        visit "/libraries/#{@koelbel.id}/books"

        expect(page).to have_content("ID: #{@book1.id}")
        expect(page).to have_content("ID: #{@book2.id}")
        expect(page).to have_content("Created: #{@book1.created_at}")
        expect(page).to have_content("Created: #{@book2.created_at}")
        expect(page).to have_content("Updated: #{@book1.updated_at}")
        expect(page).to have_content("Updated: #{@book2.updated_at}")
    end
end