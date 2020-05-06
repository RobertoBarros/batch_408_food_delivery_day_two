class Router
  def initialize(meals_controller, customers_controller, sessions_controller, orders_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @orders_controller = orders_controller
  end

  def run

    employee = @sessions_controller.sign_in

    loop do
      if employee.manager?
        choose = options_manager
        case choose
        when 1 then @meals_controller.add
        when 2 then @meals_controller.list
        when 3 then @customers_controller.add
        when 4 then @customers_controller.list
        when 5 then @orders_controller.add
        when 6 then @orders_controller.list_undelivered_orders
        end
      else
        choose = options_delivery_guy
        case choose
        when 1 then @orders_controller.mark_as_delivered(employee)
        when 2 then @orders_controller.list_my_orders(employee)
        end
      end



    end
  end

  private

  def options_delivery_guy
    puts '-' * 100
    puts '--- ORDERS OPTIONS'
    puts '-' * 100
    puts '1. Mark order as deliverd'
    puts '2. List my undelivered orders'
    puts '-' * 100
    puts 'Enter your option:'
    gets.chomp.to_i
  end


  def options_manager
    puts '-' * 100
    puts '--- MEALS OPTIONS'
    puts '-' * 100
    puts '1. Add Meal'
    puts '2. List All Meals'
    puts '--- CUSTOMERS OPTIONS'
    puts '-' * 100
    puts '3. Add Customer'
    puts '4. List All Customers'
    puts '--- ORDERS OPTIONS'
    puts '-' * 100
    puts '5. Add New Order'
    puts '6. List Undelivered Orders'
    puts '-' * 100
    puts 'Enter your option:'
    gets.chomp.to_i
  end
end
