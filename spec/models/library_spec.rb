require 'rails_helper'

RSpec.describe Library, type: :model do
    
    describe 'validations' do
        it { should validate_presence_of :name}
        it { should validate_presence_of :branch_num}
        it { should validate_presence_of :city}
        it { should allow_value(true).for(:open) }
        it { should allow_value(false).for(:open) }
    end

    describe 'relationships' do
        it { should have_many :books }
    end
end