class Invoice < ActiveRecord::Base

    has_many :products

    @@all = []

    def initialize(invoice_name,client_name)
        @invoice_name = invoice_name
        @client_name = client_name
        @products = []

        @@all << self 
    end

    def gen_invoice_num
        invoice_file = File.open("./invoices.text")
        invoice_text = invoice_file.read
        invocie_file.close

        list = invoice_text.split(/[\n]/)
        list = list.collect do |row|
            row.split(/[,]/)
        end 
    end 

    def all_attr
        "INVOICE:#{@invoice_name}/CLIENT_NAME:#{@client_name}\n"
    end

    def add_product(name,type,price)
        new_product = Product.new(name,type,price)
        @products << new_product
    end

    def total
        @total = nill
        @products.each do |product|
            @total += product.price
        end 
        @total
    end 

    def export
        template = "<h1>Tres Chicas Jewelry</h1>
        <h2>Invoice:#{self.invoice_name}</h2>
        <h3>Items:</h3>
        <h3>Total:#{self.total}</h3>"

        html = File.new("#{self.invoice_name}.html", "w")
        File.write("#{self.invoice_name}.html", template)
    end 
end