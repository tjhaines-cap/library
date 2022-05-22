class Book < ApplicationRecord
    belongs_to :library
    validates_presence_of :title, :author, :copyright
    validates :available, inclusion: [true, false]

    def self.available
        where(available: true)
    end

    def self.order_by_title
        order(:title)
    end

    def self.records_over_threshold(year)
        where("copyright >= #{year}")
    end
end