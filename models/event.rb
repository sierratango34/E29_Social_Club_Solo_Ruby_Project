require_relative('../db/sql_runner')

class Event

  attr_reader :id
  attr_accessor :type, :max_capacity

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @type = options['type']
    @max_capacity = options['max_capacity'].to_i
  end

  #CRUD actions
  def save()
    sql = 'INSERT INTO events (type, max_capacity) VALUES ($1, $2) RETURNING id'
    values = [@type, @max_capacity]
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
    sql = 'UPDATE events SET (type, max_capacity) = ($1, $2) WHERE id = $3'
    values = [@type, @max_capacity, @id]
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

  def confirmed_members_attending_and_their_booking_ids
    sql = 'SELECT members.id AS member_id, members.first_name AS first_name, members.last_name AS last_name, bookings.id AS booking_id
    FROM members
    INNER JOIN bookings
    ON bookings.member_id = members.id
    INNER JOIN events
    ON bookings.event_id = events.id
    WHERE events.id = $1 AND bookings.confirmed = true'
    values = [@id]
    members_and_their_booking_refs = SqlRunner.run(sql, values)
    return members_and_their_booking_refs
  end

  def unconfirmed_members_attending_and_their_booking_ids
    sql = 'SELECT members.id AS member_id, members.first_name AS first_name, members.last_name AS last_name, bookings.id AS booking_id
    FROM members
    INNER JOIN bookings
    ON bookings.member_id = members.id
    INNER JOIN events
    ON bookings.event_id = events.id
    WHERE events.id = $1 AND bookings.confirmed = false'
    values = [@id]
    members_and_their_booking_refs = SqlRunner.run(sql, values)
    return members_and_their_booking_refs
  end

  def all_bookings
    sql = 'SELECT events.*
    FROM events
    INNER JOIN bookings
    ON bookings.event_id = events.id
    WHERE events.id = $1'
    values = [@id]
    bookings_data_array = SqlRunner.run(sql, values)
    return bookings_data_array
  end

  def all_bookings_count
    sql = 'SELECT events.*
    FROM events
    INNER JOIN bookings
    ON bookings.event_id = events.id
    WHERE events.id = $1'
    values = [@id]
    bookings_data_array = SqlRunner.run(sql, values)
    return bookings_data_array.count
  end

  def confirmed_bookings
    sql = 'SELECT events.*
    FROM events
    INNER JOIN bookings
    ON bookings.event_id = events.id
    WHERE events.id = $1 AND bookings.confirmed = true'
    values = [@id]
    bookings_data_array = SqlRunner.run(sql, values)
    return bookings_data_array
  end

  def confirmed_bookings_count
    sql = 'SELECT events.*
    FROM events
    INNER JOIN bookings
    ON bookings.event_id = events.id
    WHERE events.id = $1 AND bookings.confirmed = true'
    values = [@id]
    bookings_data_array = SqlRunner.run(sql, values)
    return bookings_data_array.count
  end

  def self.search_by_type(data)
    searched_event = data.downcase.split(' ')
    events = []
    for string in searched_event
      sql = 'SELECT *
      FROM events
      WHERE LOWER(type) LIKE $1'
      values = ['%' + string + '%']
      events_hash = SqlRunner.run(sql, values)
      events << map_items(events_hash)
    end
      events = events.flatten.uniq{ |event| event.id }
      result = []
    for event in events
      if searched_event.include?(event.type.downcase)
        result << event
      end
    end
    return events if result.empty?
    return result
  end

  def has_spaces?
    return all_bookings_count < @max_capacity
  end

  def self.map_items(event_data)
    return event_data.map { |hash| Event.new(hash) }
  end

end
