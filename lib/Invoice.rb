class Invoice 

    
    @@all = []

    def initialize(invoice_name,client_name)
        @invoice_name = invoice_name
        @client_name = client_name
        @products = []

        @@all << self 
    end

    def all_attr
        "INVOICE:#{@invoice_name}/CLIENT_NAME:#{@client_name}\n"
    end

    def add_product(product)
        @products << product
    end 
end