require_relative('../db/sql_runner')

class Event

  attr_reader :id
  attr_accessor :type, :number_attending, :max_capacity

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @type = options['type']
    @number_attending = options['number_attending'].to_i
    @max_capacity = options['max_capacity'].to_i
  end

  #CRUD actions
  def save()
    sql = 'INSERT INTO events (type, number_attending, max_capacity) VALUES ($1, $2, $3) RETURNING id'
    values = [@type, @number_attending, @max_capacity]
    results = SqlRunner.run(sql, values).first
    @id = results['id'].to_i
  end

  def self.all()
    sql = 'SELECT * FROM events'
    event_data = SqlRunner.run(sql)
    events = map_items(event_data)
    return events
  end

  def update()
    sql = 'UPDATE events SET (type, number_attending, max_capacity) = ($1, $2, $3) WHERE id = $4'
    values = [@type, @number_attending, @max_capacity, @id]
    results = SqlRunner.run(sql, values)
  end

  def delete()
    sql = 'DELETE FROM events WHERE id = $1'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = 'DELETE FROM events'
    SqlRunner.run(sql)
  end

  #additional methods
  def self.find(id)
    sql = 'SELECT * FROM events WHERE id = $1'
    values = [id]
    event = SqlRunner.run(sql, values).first
    result = Event.new(event)
    return result
  end

  def members_attending
    sql = 'SELECT members.* FROM members INNER JOIN bookings ON bookings.member_id = members.id WHERE bookings.event_id = $1'
    values = [@id]
    member_data = SqlRunner.run(sql, values)
    return member_data.map { |hash| Member.new(hash)  }
  end

  def members_attending_and_their_booking_ids
    sql = 'SELECT members.id AS member_id, members.first_name AS first_name, members.last_name AS last_name, bookings.id AS booking_id
    FROM members
    INNER JOIN bookings
    ON bookings.member_id = members.id
    INNER JOIN events
    ON bookings.event_id = events.id
    WHERE events.id = $1'
    values = [@id]
    members_and_their_booking_refs = SqlRunner.run(sql, values)
    return members_and_their_booking_refs
  end

  def increase_number_attending
    @number_attending += 1
  end
  
  def self.map_items(event_data)
    return event_data.map { |hash| Event.new(hash) }
  end
end
