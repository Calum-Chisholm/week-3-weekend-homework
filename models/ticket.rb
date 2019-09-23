require_relative('../db/sql_runner')

class Ticket

  attr_accessor :screaning_id, :customer_id
  attr_reader :id

  def initialize(details)
    @id = details['id'] if details['id']
    @screaning_id = details['screaning_id']
    @customer_id = details['customer_id']
  end

  def save
   sql = 'INSERT INTO tickets (screaning_id, customer_id)
         VALUES ($1, $2) RETURNING id'
   values = [@screaning_id, @customer_id]
   @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def update
    sql = 'UPDATE tickets SET screaning_id = $1, customer_id = $2 WHERE id = $3'
    values = [@screaning_id, @customer_id, @id]
    SqlRunner.run(sql, values)
  end

  def Ticket.delete_all
     sql = 'DELETE FROM tickets'
     SqlRunner.run(sql)
  end

  def Ticket.delete(id)
    sql = 'DELETE FROM tickets WHERE id = $1'
    values = [id]
    SqlRunner.run(sql, values)
  end

end #class end
