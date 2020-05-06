class OrderRepository
  CSV_OPTIONS = { headers: :first_row, header_converters: :symbol }

  def initialize(csv_file, meal_repository, customer_repository, employee_repository)
    @csv_file = csv_file
    @orders = []
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    load_csv if File.exist?(@csv_file)
    @next_id = @orders.empty? ? 1 : @orders.last.id + 1
  end

  def add(order)
    order.id = @next_id
    @orders << order
    save_csv
    @next_id += 1
  end

  def all
    @orders
  end

  def find(id)
    @orders.select { |order| order.id == id }.first
  end

  def undelivered_orders
    @orders.reject(&:delivered?)
    # @orders.reject { |order| order.delivered? }
  end

  def save_csv
    CSV.open(@csv_file, 'wb', CSV_OPTIONS) do |csv|
      csv << %i[id delivered meal_id customer_id employee_id]

      @orders.each do |order|
        csv << [order.id, order.delivered?, order.meal.id, order.customer.id, order.employee.id]
      end
    end
  end


  private

  def load_csv
    CSV.foreach(@csv_file, CSV_OPTIONS) do |row|
      meal_id = row[:meal_id].to_i
      meal = @meal_repository.find(meal_id)

      customer_id = row[:customer_id].to_i
      customer = @customer_repository.find(customer_id)

      employee_id = row[:employee_id].to_i
      employee = @employee_repository.find(employee_id)

      order = Order.new(id: row[:id].to_i,
                        delivered: row[:delivered] == 'true',
                        meal: meal,
                        customer: customer,
                        employee: employee)
      @orders << order
    end
  end


end