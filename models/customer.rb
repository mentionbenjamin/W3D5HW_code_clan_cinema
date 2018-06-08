require_relative('../db/sql_runner.rb')

class Customer

  attr_reader(:id)
  attr_reader(:name, :funds)

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @name = details['name']
    @funds = details['funds'].to_i
  end

  def save() # save function
    sql = "INSERT INTO customers
           (name, funds)
           VALUES ($1, $2)
           RETURNING id"
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values).first
    @id = customer['id'].to_i()
  end

  def self.all() # select and display all self(customers)
    sql = "SELECT * FROM customers"
    values = []
    customers = SqlRunner.run(sql, values)
    results = Customer.map_items(customers)
    return results
  end

  def delete.all()
    sql = "DELETE * FROM customers"
    values = []
    SqlRunner.run(sql, values)
  end





  def self.map_items(customer_data) # refactoring shortcut
    return customer_data.map {|customer| Customer.new(customer)}
  end


end
