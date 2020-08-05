class Part < ApplicationRecord
    has_many :car_parts
    has_many :cars, through: :car_parts
    validates :name, presence: true, uniqueness: true, length: {maximum: 20}
end
