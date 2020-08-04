class Car < ApplicationRecord
    belongs_to :make
    has_many :car_parts
    has_many :parts, through: :car_parts
    validates :model, length: {in: 2..20}
    validates :vin, length: {is: 10}, uniqueness: true, presence: true
end
