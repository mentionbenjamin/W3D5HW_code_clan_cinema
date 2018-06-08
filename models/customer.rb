require_relative('../db/sql_runner.rb')

class Customer

  attr_reader(:id)
  attr_accessor(:name, :funds)

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @name = details['name']
    @funds = details['funds'].to_i
  end

  def save() #CREATE & save
    sql = "INSERT INTO customers
           (name, funds)
           VALUES ($1, $2)
           RETURNING id"
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values).first
    @id = customer['id'].to_i()
  end

  def self.all() #READ & display all customers
    sql = "SELECT * FROM customers"
    values = []
    customers = SqlRunner.run(sql, values)
    results = Customer.map_items(customers)
    return results
  end

  def update #UPDATE
    sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all() #DELETE all customers
    sql = "DELETE FROM customers"
    values = []
    SqlRunner.run(sql, values)
  end



  def self.map_items(customer_data) #refactoring shortcut
    return customer_data.map {|customer| Customer.new(customer)}
  end


end
