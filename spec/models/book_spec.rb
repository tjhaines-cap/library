require 'rails_helper'

RSpec.describe Book, type: :model do

    describe 'validations' do
        it { should validate_presence_of :title }
        it { should validate_presence_of :author }
        it { should validate_presence_of :copyright }
        it { should validate_presence_of :available }
        # it { should allow_value(true).for(:available) }
        # it { should allow_value(false).for(:available) }
    end

    describe 'relationships' do

    end
end