class CreateProducts < ActiveRecord::Migration[5.1]
    def change
        create_table :products do |t|
            t.string :name
            t.integer :price
            t.integer :whole_price
            t.string :sku
            t.integer :invoice_id
        end 
    end 
end 