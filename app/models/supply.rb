class Supply < ApplicationRecord
    has_many :products
    has_many :transactions, through: :products

    belongs_to :category

    def collect_products_with_transactions
        products = Product.where(supply_id: self.id).includes(:transactions)
        
        products.map do |product|
          { 
            product: product, 
            transactions: product.transactions.to_a
          }
        end
    end
    
    def calculate_total(transactions, product_quantity = 1)
        transactions.reduce(0) do |sum, t|
            case t.transaction_type
            when "IN"
                sum += t.quantity * product_quantity
            when "OUT"
                sum -= t.quantity * product_quantity
            end
            sum
        end
    end
    
    def total_stock
        pwt = collect_products_with_transactions
        transactions = pwt.flat_map { |e| e[:transactions] }
        calculate_total(transactions)
    end
    
    def total_quantity
        pwt = collect_products_with_transactions
        pwt.reduce(0) do |sum, entry|
          sum + calculate_total(entry[:transactions], entry[:product].quantity)
        end
    end

    # 以下はChatGPTにリファクタさせる前
    # TODO: なぜこれが同じ機構なのか考える

    # def calculate_total_stock(transactions)
    #     sum = 0

    #     transactions.each do |t|
    #         if t.transaction_type == "IN"
    #             sum += t.quantity
    #         elsif transaction.transaction_type == "OUT"
    #             sum -= t.quantity
    #         end
    #     end
    #     sum
    # end

    # def calculate_total_quantity(products_with_transactions)
    #     sum = 0

    #     products_with_transactions.each do |pwt|
    #         product_quantity = pwt[:product].quantity

    #         pwt[:transactions].each do |t|
    #             if t.transaction_type == "IN"
    #                 sum += t.quantity * product_quantity
    #             elsif t.transaction_type == "OUT"
    #                 sum -= t.quantity *  product_quantity
    #             end
    #         end
    #     end
    #     sum
    # end

    # def collect_products_with_transactions
    #     products = Product.where(supply_id: self.id).includes(:transactions)
        
    #     products_with_transactions = products.map do |product|
    #         { 
    #             product: product, 
    #             transactions: product.transactions.to_a,
    #         }
    #     end
        
    #     products_with_transactions
    # end

    # def total_stock
    #     pwt = self.collect_products_with_transactions
    #     transactions = pwt.flat_map { |e| e[:transactions] }
    #     total = calculate_total_stock(transactions)
    #     total
    # end
    
    # def total_quantity
    #     pwt = self.collect_products_with_transactions
    #     total = calculate_total_quantity(pwt)
    #     total
    # end
end