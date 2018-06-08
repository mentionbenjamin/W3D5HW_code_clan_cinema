require_relative('../models/customer.rb')
# require_relative('../models/film.rb')
# require_relative('../models/ticket.rb')

require('pry')


Customer.delete_all()


customer1 = Customer.new({'name' => 'Ben', 'funds' => 20})
customer1.save()
customer2 = Customer.new({'name' => 'Zsolt', 'funds' => 5})
customer2.save()

# film1 = Film.new({'title' => 'Star Wars', 'price' => 10})
# film2 = Film.new({'title' => 'Harry Potter', 'price' => 15})
# film3 = Film.new({'title' => 'Ratatouille', 'price' => 5})






binding.pry
nil
