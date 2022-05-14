class Library < ApplicationRecord
    has_many :books
    validates_presence_of :name, :branch_num, :city
    validates :open, inclusion: [true, false]

    def self.sort_by_created_at
        Library.order(:created_at).reverse_order
    end
end