class Book < ApplicationRecord
    belongs_to :library
    validates_presence_of :title, :author, :copyright
    validates :available, inclusion: [true, false]

    def self.available
        Book.where(available: true)
    end
end