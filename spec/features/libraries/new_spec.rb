# As a visitor
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' where I  see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.

require 'rails_helper' 

RSpec.describe 'Library creation' do
    it 'links to new library page from library index' do
        visit '/libraries' 

        click_link("New Library")

        expect(current_path).to eq('/libraries/new')
    end

    it 'can create a new library' do
        visit '/libraries/new' 

        fill_in('Name', with: "Koelbel")
        click_button('Create Library')
        library_id = Library.last.id
        
        expect(current_path).to eq("/libraries/#{library_id}")
        expect(page).to have_content("Koelbel")
    end
end