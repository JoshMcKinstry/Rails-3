class Car < ApplicationRecord
    belongs_to :make
    has_many :car_parts
    has_many :parts, through: :car_parts
    validates :vin, :model, presence: true
    validates :vin, length: {is: 10}, uniqueness: true
end
