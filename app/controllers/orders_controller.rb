require_relative '../views/orders_view'

class OrdersController
  def initialize(meal_repository, customer_repository, employee_repository, order_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @order_repository = order_repository

    @view = OrdersView.new
    @mealsView = MealsView.new
    @customerView = CustomersView.new
  end

  def add

    @mealsView.list(@meal_repository.all)
    # Ask user meal id
    meal_id = @view.ask_meal_id
    meal = @meal_repository.find(meal_id)

    @customerView.list(@customer_repository.all)
    # Ask user customer id
    customer_id = @view.ask_customer_id
    customer = @customer_repository.find(customer_id)

    # Ask user employee id
    delivery_guys = @employee_repository.all_delivery_guys
    @view.list_delivery_guys(delivery_guys)
    employee_index = @view.ask_employee_index
    employee = delivery_guys[employee_index]

    order = Order.new(meal: meal, customer: customer, employee: employee)

    @order_repository.add(order)
  end

  def mark_as_delivered(employee)

    # list all undelivered orders
    list_my_orders(employee)

    order_index = @view.ask_order_index
    order = @order_repository.undelivered_orders.select { |order| order.employee.id == employee.id }[order_index]

    order.deliver!
    @order_repository.save_csv


  end

  def list_undelivered_orders
    undelivered_orders = @order_repository.undelivered_orders
    @view.list(undelivered_orders)
  end

  def list_my_orders(employee)
    orders = @order_repository.undelivered_orders.select { |order| order.employee.id == employee.id }
    @view.list(orders)

  end


end
