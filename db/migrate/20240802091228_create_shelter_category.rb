class CreateShelterCategory < ActiveRecord::Migration[7.0]
  def change
    create_table :shelters do |t|
      t.string :name, null: false 
      t.string :location_address, null: false 
      t.text :contact_info, null: false 

      t.timestamps
    end

    create_table :categories do |t|
      t.string :name, null: false
      t.text :description

      t.timestamps
    end
  end
end
