require_relative('customer')
require_relative('film')
require_relative('screaning')
require_relative('ticket')
require('pry')


new_customer1 = {
  'name' => 'Joe',
  'funds' => 100
}

new_customer2 = {
  'name' => 'Robert',
  'funds' => 50
}

new_customer3 = {
  'name' => 'Simon',
  'funds' => 75
}

customer1 = Customer.new(new_customer1)
customer1.save
customer2 = Customer.new(new_customer2)
customer2.save
customer3 = Customer.new(new_customer3)
customer3.save

new_film1 = {
  'title' => 'Bill and Ted',
  'price' => 30
}

new_film2 = {
  'title' => 'Sky High',
  'price' => 20
}

new_film3 = {
  'title' => 'The Greatest Showman',
  'price' => 5
}

film1 = Film.new(new_film1)
film1.save
film2 = Film.new(new_film2)
film2.save
film3 = Film.new(new_film3)
film3.save

new_screaning1 = {
  'film_id' => film1.id,
  'screaning_time' => '2019-01-08 04:00:00'
}

new_screaning2 = {
  'film_id' => film2.id,
  'screaning_time' => '2019-12-08 06:25:00'
}

new_screaning3 = {
  'film_id' => film3.id,
  'screaning_time' => '2019-05-08 02:45:00'
}

screaning1 = Screaning.new(new_screaning1)
screaning1.save
screaning2 = Screaning.new(new_screaning2)
screaning2.save
screaning3 = Screaning.new(new_screaning3)
screaning3.save

new_ticket1 = {
  'screaning_id' => screaning1.id,
  'customer_id' => customer1.id
}

new_ticket2 = {
  'screaning_id' => screaning2.id,
  'customer_id' => customer2.id
}

new_ticket3 = {
  'screaning_id' => screaning3.id,
  'customer_id' => customer3.id
}

ticket1 = Ticket.new(new_ticket1)
ticket1.save
ticket2 = Ticket.new(new_ticket2)
ticket2.save
ticket3 = Ticket.new(new_ticket3)
ticket3.save




binding.pry
