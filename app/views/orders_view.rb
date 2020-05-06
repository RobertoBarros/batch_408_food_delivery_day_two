class OrdersView
  def ask_meal_id
    puts 'Enter the meal id:'
    gets.chomp.to_i
  end

  def ask_customer_id
    puts 'Enter the customer id:'
    gets.chomp.to_i
  end

  def ask_employee_index
    puts 'Enter the employe index:'
    gets.chomp.to_i - 1
  end

  def ask_order_index
    puts 'Enter the order index:'
    gets.chomp.to_i - 1
  end

  def list(orders)
    orders.each_with_index do |order, index|
      puts "#{index + 1} | Meal: #{order.meal.name} | Customer: #{order.customer.name} | Delivered by #{order.employee.username}"
    end
  end

  def list_delivery_guys(delivery_guys)
    delivery_guys.each_with_index do |delivery_guy, index|
      puts "#{index + 1} - #{delivery_guy.username}"
    end
  end


end
