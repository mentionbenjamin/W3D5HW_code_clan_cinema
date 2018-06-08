require_relative('../models/customer.rb')
require_relative('../models/film.rb')
# require_relative('../models/ticket.rb')

require('pry')


Customer.delete_all()
Film.delete_all()


customer1 = Customer.new({'name' => 'Ben', 'funds' => 20})
customer1.save()
customer2 = Customer.new({'name' => 'Zsolt', 'funds' => 5})
customer2.save()

film1 = Film.new({'title' => 'Star Wars', 'price' => 10})
film1.save()
film2 = Film.new({'title' => 'Harry Potter', 'price' => 15})
film2.save()
film3 = Film.new({'title' => 'Ratatouille', 'price' => 5})
film3.save()

ticket1 = Ticket.new({'customer_id' => 'customer1.id', 'film_id' => 'film3.id'})
ticket2 = Ticket.new({'customer_id' => 'customer2.id', 'film_id' => 'film1.id'})
ticket3 = Ticket.new({'customer_id' => 'customer3.id', 'film_id' => 'film3.id'})







binding.pry
nil
