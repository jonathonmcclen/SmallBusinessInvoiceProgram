class CreateInvoices < ActiveRecord::Migration[5.1]
    def change
        create_table :invoices do |t|
            t.string :description
            t.string :for
        end 
    end 
end 