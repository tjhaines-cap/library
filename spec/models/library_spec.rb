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

    describe 'sort libraries by created_at' do
        it 'returns the libraries sorted from most to least recently created' do
            koelbel = Library.create!(name: "Koelbel", branch_num: 1, city: "Centennial", open: true)
            sheridan = Library.create!(name: "Sheridan", branch_num: 3, city: "Denver", open: false)
            sorted_libraries = Library.sort_by_created_at

            expect(sorted_libraries).to eq([sheridan, koelbel])
        end
    end
end