require_relative 'config/enviornment'

def program_loop
    user_command = gets
    check_user_command(user_command)
    program_loop
end 

def check_user_command(command)
    command = command.strip.downcase
    if command == "new"
        new_invoice
    elsif command == "edit"
        edit_invoice
    elsif command == "export"
        export
    elsif command == "help"
        command_list
    else
        puts "#{command} is not a valid command."
    end 
end

def edit_invoice
    puts "Enter the invoice number of the invoice you would like to edit."
    invoice_num = gets
    #search invoices
end 

def export
    puts "Which invocie would you like to EXPORT?"
    invoice_num = gets
end 

def add_product(invoice)
    puts "Product Name:"
    name = gets.delete("\n")
    puts "Product Price:"
    price = gets.delete("\n")
    puts "Type a breif description of this product."
    description = gets.delete("\n")

    invoice.add_product(name,price,description)
    puts "Your new product has been added successfuly!"
    puts "Would you like to add another product? (Y/N)"

    if gets.downcase == "y"
        add_product(invoice)
    end 
end

def new_invoice
    #creates new invoice
    #checks last invoice number then ads one

    puts "What Should we call this invoice?"
    invoice_name = gets.delete("\n")
    puts "Who is this invoice for?"
    client_name = gets.delete("\n")
    invoice = Invoice.new(invoice_name,client_name)
    divider
    puts "Your new invoice was generated successfuly!"
    divider
    puts "Add a product to your new invoice?"
    
    if gets.downcase == "y"
        add_product(invoice)
    end 

    #new = File.open("invoices.txt", "a")
    #new.write invoice.all_attr
    #new.close
end 

def divider
    puts "-------------------------------------------------------------------------"
end 

def line_break
    puts ""
end 

def command_list
    puts "Type 'new' to create a new invoice."
    puts "Type 'edit' to edit a saved invoice."
    puts "Type 'export' to export a saved invoice."
end 

def cold_open_welcome
    divider
    company = "Tres Chicas Jewelry"
    puts "Welcome to #{company} Invoice Program."
    divider 
    puts "Type 'help' for a list of helpful commands"
end

def read_invoices
    file = File.open("./invoices.txt")
    file_text = file.read
    file.close

    invoices = file_text.split(":")

    list = list.collect do |row|
        row.split(/[,]/)
    end

end 

def write_invoice
    sku_list = File.open("./config/skus")
    sku_text = sku_list.read
    sku_list.close
end 

startup_tests
cold_open_welcome
program_loop