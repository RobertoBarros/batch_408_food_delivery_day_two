require_relative '../views/customers_view'

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @view = CustomersView.new
  end

  def add
    # Ask to user the customer name
    name = @view.ask_name
    # Ask to user the customer price
    address = @view.ask_address
    # instatiate new customer
    customer = Customer.new(name: name, address: address)
    # Add my new customer in the repository
    @customer_repository.add(customer)
  end

  def list
    customers = @customer_repository.all
    @view.list(customers)
  end
end
