class Book < ApplicationRecord
    belongs_to :library
    validates_presence_of :title, :author, :copyright
    validates :available, inclusion: [true, false]

    def self.available
        Book.where(available: true)
    end

    def self.order_by_title
        Book.order(:title)
    end

    def self.records_over_threshold(year)
        Book.where("copyright >= #{year}")
    end
end