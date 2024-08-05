class Transaction < ApplicationRecord
    has_one :product
    has_one :shelter
end