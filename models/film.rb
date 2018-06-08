require_relative('../db/sql_runner.rb')

class Film


  attr_reader(:id)
  attr_accessor(:title, :price)

  def initialize(details)
    @id = details['id'].to_i if details[:id]
    @title = details['title']
    @price = details['price'].to_i
  end

  def save() #CREATE & save
    sql = "INSERT INTO films
           (title, price)
           VALUES ($1, $2)
           RETURNING id"
    values = [@title, @price]
    film = SqlRunner.run(sql, values).first
    @id = film['id'].to_i()
  end

  def self.all() #READ & display all films
    sql = "SELECT * FROM films"
    values = []
    films = SqlRunner.run(sql, values)
    results = Film.map_items(films)
    return results
  end

  def update #UPDATE
    sql = "UPDATE films SET (title, price) = ($1, $2) WHERE id = $3"
    values = [@name, @price, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all() #DELETE all customers
    sql = "DELETE FROM films"
    values = []
    SqlRunner.run(sql, values)
  end


  def self.map_items(film_data) #refactoring shortcut
    return film_data.map {|film| Film.new(film)}
  end





end
