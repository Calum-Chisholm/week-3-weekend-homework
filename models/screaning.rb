require_relative('../db/sql_runner')
require_relative('./film')

class Screaning

attr_accessor :film_id, :screaning_time
attr_reader :id

  def initialize(details)
    @id = details['id'] if details['id']
    @film_id = details['film_id']
    @screaning_time = details['screaning_time']
  end

  def save
   sql = 'INSERT INTO screanings (film_id, screaning_time)
         VALUES ($1, $2) RETURNING id'
   values = [@film_id, @screaning_time]
   @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def update
    sql = 'UPDATE screanings SET film_id = $1, screaning_time = $2 WHERE id = $3'
    values = [@film_id, @screaning_time, @id]
    SqlRunner.run(sql, values)
  end

  def Screaning.delete_all
     sql = 'DELETE FROM screanings'
     SqlRunner.run(sql)
  end

  def Screaning.delete(id)
    sql = 'DELETE FROM screanings WHERE id = $1'
    values = [id]
    SqlRunner.run(sql, values)
  end


end #class end
