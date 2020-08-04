class Make < ApplicationRecord
    has_many :cars
    validates :name, :country, presence: true
end
