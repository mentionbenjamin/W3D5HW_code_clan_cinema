require_relative('../db/sql_runner.rb')
require_relative('./film.rb')
require_relative('./customer.rb')

class Ticket

  attr_reader(:id)
  attr_accessor(:customer_id, :film_id)

  def initialize(details)
    @id = details['id'].to_i if details[:id]
    @customer_id = details['customer_id'].to_i
    @film_id = details['film_id'].to_i
  end

  def save() #CREATE & save
    sql = "INSERT INTO tickets
           (customer_id, film_id)
           VALUES ($1, $2)
           RETURNING id"
    values = [@customer_id, @film_id]
    ticket = SqlRunner.run(sql, values).first
    @id = ticket['id'].to_i()
  end

  def self.all() #READ & display all tickets
    sql = "SELECT * FROM tickets"
    values = []
    tickets = SqlRunner.run(sql, values)
    results = Ticket.map_items(tickets)
    return results
  end

  def update #UPDATE
    sql = "UPDATE tickets SET (customer_id, film_id) = ($1, $2) WHERE id = $3"
    values = [@customer_id, @film_id, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all() #DELETE all customers
    sql = "DELETE FROM films"
    values = []
    SqlRunner.run(sql, values)
  end



  def self.map_items(ticket_data) #refactoring shortcut
    return ticket_data.map {|ticket| Ticket.new(ticket)}
  end






end
