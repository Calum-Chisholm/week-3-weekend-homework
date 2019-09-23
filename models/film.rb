require_relative('../db/sql_runner')

class Film

  attr_accessor :title, :price
  attr_reader :id

  def initialize(details)
    @id = details['id'] if details['id']
    @title = details['title']
    @price = details['price']
  end

  def save
   sql = 'INSERT INTO films (title, price)
         VALUES ($1, $2) RETURNING id'
   values = [@title, @price]
   @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def update
    sql = 'UPDATE films SET title = $1, price = $2 WHERE id = $3'
    values = [@title, @price, @id]
    SqlRunner.run(sql, values)
  end

  def Film.delete_all
     sql = 'DELETE FROM films'
     SqlRunner.run(sql)
  end

  def Film.delete(id)
    sql = 'DELETE FROM films WHERE id = $1'
    values = [id]
    SqlRunner.run(sql, values)
  end


end #class end
