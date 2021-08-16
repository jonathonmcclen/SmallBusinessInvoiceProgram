require_relative 'config/enviornment'

def startup_tests
    if !File.exist?("invoices.txt")
        File.new("invoices.txt", "w").close
    end 
end 

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
        puts "#{command}"
    elsif command == "export"
        puts "#{command}"
    elsif command == "help"
        command_list
    else
        puts "#{command} is not a valid command."
    end 

end

def add_product(invoice)
    puts "What Should we call this product?"
    name = gets. delete("\n")
    puts "What is the price of this product?"
    price = gets. delete("\n")
    puts "please type a breif description of this product"
    description = gets. delete("\n")

    invoice.add_product([name,price,description])
    puts "Your new product has been addes successfuly!"
    puts "Would you like to add another product? (Y/N)"

    if gets.downcase == "y"
        add_product
    end 
end

def new_invoice
    puts "What Should we call this invoice?"
    invoice_name = gets. delete("\n")
    puts "Who is this invoice for?"
    client_name = gets. delete("\n")
    invoice = Invoice.new(invoice_name,client_name)
    divider
    puts "Your new invoice was generated successfuly!"
    divider
    puts "We asume you want to add a product to your new invoice."
    add_product(invoice)
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
    puts "Welcome to #{company} Invoice Genorator."
    divider 
    puts "Type 'help' for a list of helpful commands"
end 

startup_tests
cold_open_welcome
program_loop