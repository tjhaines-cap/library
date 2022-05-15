require 'rails_helper' 

RSpec.describe 'Library creation' do
    it 'links to new library page from library index' do
        visit '/libraries' 

        click_link("New Library")

        expect(current_path).to eq('/libraries/new')
    end

    it 'can create a new library' do
        visit '/libraries/new' 

        fill_in('Name', with: "Smoky Hill")
        fill_in('branch_num', with: 1)
        fill_in('city', with: "Centennial")
        fill_in('open', with: true)
        click_button('Create Library')
        library_id = Library.last.id

        expect(current_path).to eq("/libraries")
        expect(page).to have_content("Smoky Hill")
    end
end