class Supply < ApplicationRecord
    has_many :products
    has_many :transactions, through: :products

    belongs_to :category
end