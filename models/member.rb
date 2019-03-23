require_relative('../db/sql_runner')

class Member

  attr_reader :first_name, :last_name, :attendance_count, :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @attendance_count = options['attendance_count'].to_i
  end

  #CRUD actions
  def save()
    sql = 'INSERT INTO members (first_name, last_name, attendance_count) VALUES ($1, $2, $3) RETURNING id'
    values = [@first_name, @last_name, @attendance_count]
    results = SqlRunner.run(sql, values).first
    @id = results['id'].to_i
  end

  def self.all()
    sql = 'SELECT * FROM members'
    results = SqlRunner.run(sql)
    return results.map { |hash| Member.new(hash) }
  end

  def update()
    sql = 'UPDATE members SET (first_name, last_name, attendance_count) = ($1, $2, $3) WHERE id = $4'
    values = [@first_name, @last_name, @attendance_count, @id]
    results = SqlRunner.run(sql, values)
  end

  def delete()
    sql = 'DELETE FROM members WHERE id = $1'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = 'DELETE FROM members'
    SqlRunner.run(sql)
  end

  #Additional methods
  def self.find(id)
    sql = 'SELECT * FROM members WHERE id = $1'
    values = [id]
    member = SqlRunner.run(sql, values).first
    result = Member.new(member)
    return result
  end

  def events_attending
    sql = 'SELECT events.* FROM events INNER JOIN bookings ON bookings.event_id = events.id WHERE bookings.member_id = $1'
    values = [@id]
    event_data = SqlRunner.run(sql, values)
    return event_data.map { |hash| Event.new(hash)  }
  end
end
