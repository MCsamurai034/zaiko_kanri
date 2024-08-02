class CreateStocksEditProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :stocks do |t|
      t.references :shelter, null: false, foreign_key: true
      t.references :supply, null: false, foreign_key: true
      t.integer :total_quantity, null: false

      t.timestamps
    end
    #pruductsの変更
    add_column :products, :quantity, :float

    remove_column :products, :stock, :integer
    remove_column :products, :price, :decimal

    add_reference :products, :supply, null: false, foreign_key: true
    
  end
end
