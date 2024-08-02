class CreateSupplyTransactuon < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.references :product, null: false, foreign_key: true
      t.references :shelter, null: false, foreign_key: true
      t.string :transaction_type, null: false 
      t.integer :quantity, null: false 
      t.date :transaction_date, null: false

      t.timestamps
    end

    create_table :supplies do |t|
      t.references :category, null: false, foreign_key: true
      t.string :name, null: false
      t.string :unit, null: false
      t.text :description

      t.timestamps
    end
  end
end
