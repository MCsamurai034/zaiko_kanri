class Category < ApplicationRecord
    has_many :supplies
    has_many :products, through: :supplies
end
