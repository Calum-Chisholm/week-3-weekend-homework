require_relative('../db/sql_runner')

class Customer

  attr_accessor :name, :funds
  attr_reader :id

  def initialize(details)
    @id = details['id'] if details['id']
    @name = details['name']
    @funds = details['funds']
  end

  def save
   sql = 'INSERT INTO customers (name, funds)
         VALUES ($1, $2) RETURNING id'
   values = [@name, @funds]
   @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def update
    sql = 'UPDATE customers SET name = $1 WHERE id = $2'
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def Customer.delete_all
   sql = 'DELETE FROM customers'
   SqlRunner.run(sql)
  end

  def Customer.delete(id)
    sql = 'DELETE FROM customers WHERE id = $1'
    values = [id]
    SqlRunner.run(sql, values)
  end



end #class end
