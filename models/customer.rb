require_relative('../db/sql_runner.rb')

class Customer

  attr_reader(:id)
  attr_reader(:name)

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @name = details['name']
    @funds = details['funds'].to_i
  end

  def save()
    sql = "INSERT INTO customers
           (name, funds)
           VALUES ($1, $2)
           RETURNING id"
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values).first
    @id = customer['id'].to_i()
  end

  def self.all()
    sql = "SELECT * FROM users"
    values = []
    customers = SqlRunner.run(sql, values)
    result = Customer.map_items(customers)
    return results
  end








  def self.map_items(customer_data)
    return customer_data.map {|customer| Customer.new(customer)}
  end


end
