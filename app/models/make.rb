class Make < ApplicationRecord
    has_many :cars
    validates :name, presence: true, uniqueness: true, length: {maximum: 20}
    validates :country, presence: true
end
