class AddSupplyToTransactions < ActiveRecord::Migration[7.0]
  def change
    add_reference :transactions, :supply, foreign_key: true
  end
end
