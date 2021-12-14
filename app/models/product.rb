class Product < ActiveRecord::Base
    belongs_to :invoice
    def initialize(name,type,price)
        @name = name
        @type = type
        @price = price
        @sku = search_sku
    end 

    def search_sku
        sku_list = File.open("./config/skus")
        sku_text = sku_list.read
        sku_list.close

        list = sku_text.split(/[\n]/)
        list = list.collect do |row|
            row.split(/[,]/)
        end 
        #product_name, sku, retail_price, wholesale_price

        list.each do |el|
            if list[el] == @type
                return list[el+1]
            end 
        end 
    end
end 