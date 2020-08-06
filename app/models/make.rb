class Make < ApplicationRecord
    has_many :cars, dependent: :destroy
    validates :name, presence: true, uniqueness: true, length: {maximum: 20}
    validates :country, presence: true
end
