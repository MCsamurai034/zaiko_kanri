class Product < ApplicationRecord
    belongs_to :supply
    has_many :transactions

    def calculate_total(transactions)
        sum = 0

        transactions.each do |t|
            if t.transaction_type == "IN"
                sum += t.quantity
            elsif transaction.transaction_type == "OUT"
                sum -= t.quantity
            end
        end
        sum
    end

    def collect_related_transaction
        related_transactions = Transaction.where(product_id: self.id)
    end

    def total_stock
        transactions = self.collect_related_transaction
        total = calculate_total(transactions)
        total
    end
end
