class Library < ApplicationRecord
    has_many :books
    validates_presence_of :name, :branch_num, :city
    validates :open, inclusion: [true, false]

    def count_books
        self.books.count
    end

    def self.order_by_recent
        Library.order(created_at: :desc)
    end
end