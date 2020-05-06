class CustomersView
  def ask_name
    puts 'What\'s the customer name?'
    gets.chomp
  end

  def ask_address
    puts 'Enter the customer address:'
    gets.chomp
  end

  def list(customers)
    customers.each do |customer|
      puts "ID: #{customer.id} | #{customer.name} - Address: #{customer.address}"
    end
  end
end
