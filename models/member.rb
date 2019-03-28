require_relative('../db/sql_runner')

class Member

  attr_reader :id
  attr_accessor :first_name, :last_name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
  end

  #CRUD actions
  def save()
    sql = 'INSERT INTO members (first_name, last_name) VALUES ($1, $2) RETURNING id'
    values = [@first_name, @last_name]
    results = SqlRunner.run(sql, values).first
    @id = results['id'].to_i
  end

  def self.all()
    sql = 'SELECT * FROM members'
    member_data = SqlRunner.run(sql)
    members = map_items(member_data)
    return members
  end

  def update()
    sql = 'UPDATE members SET (first_name, last_name) = ($1, $2) WHERE id = $3'
    values = [@first_name, @last_name, @id]
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

  def bookings
    sql = 'SELECT * FROM bookings WHERE bookings.member_id = $1'
    values = [@id]
    booking_data = SqlRunner.run(sql, values)
    return booking_data.map { |hash| Booking.new(hash) }
  end

  def events_attending_and_their_booking_ids
    sql = 'SELECT events.type AS event_name, events.id AS event_id, bookings.id AS booking_id
    FROM events
    INNER JOIN bookings
    ON bookings.event_id = events.id
    INNER JOIN members
    ON bookings.member_id = members.id
    WHERE members.id = $1'
    values = [@id]
    events_and_booking_refs = SqlRunner.run(sql, values)
    return events_and_booking_refs
  end

  def confirmed_events_attending_and_their_booking_ids
    sql = 'SELECT events.type AS event_name, events.id AS event_id, bookings.id AS booking_id
    FROM events
    INNER JOIN bookings
    ON bookings.event_id = events.id
    INNER JOIN members
    ON bookings.member_id = members.id
    WHERE members.id = $1 AND bookings.confirmed = true'
    values = [@id]
    events_and_booking_refs = SqlRunner.run(sql, values)
    return events_and_booking_refs
  end

  def all_confirmed_bookings
    sql = 'SELECT members.*
    FROM members
    INNER JOIN bookings
    ON bookings.member_id = members.id
    WHERE members.id = $1 AND bookings.confirmed = true'
    values = [@id]
    members_bookings_data_array = SqlRunner.run(sql, values)
    return members_bookings_data_array
  end

  def all_confirmed_bookings_count
    sql = 'SELECT members.*
    FROM members
    INNER JOIN bookings
    ON bookings.member_id = members.id
    WHERE members.id = $1 AND bookings.confirmed = true'
    values = [@id]
    members_bookings_data_array = SqlRunner.run(sql, values)
    return members_bookings_data_array.count
  end

  def all_bookings
    sql = 'SELECT members.*
    FROM members
    INNER JOIN bookings
    ON bookings.member_id = members.id
    WHERE members.id = $1'
    values = [@id]
    members_bookings_data_array = SqlRunner.run(sql, values)
    return members_bookings_data_array
  end

  def all_bookings_count
    sql = 'SELECT members.*
    FROM members
    INNER JOIN bookings
    ON bookings.member_id = members.id
    WHERE members.id = $1'
    values = [@id]
    members_bookings_data_array = SqlRunner.run(sql, values)
    return members_bookings_data_array.count
  end

  def change_all_members_array_to_member_objects
    sql = 'SELECT * FROM members'
    member_data = SqlRunner.run(sql)
    @members = map_items(member_data)
    for member in @members
      return member
    end
  end

  # def self.all_alphabetical_by_first_name
  #   sql = 'SELECT * FROM members ORDER BY first_name'
  #   member_data = SqlRunner.run(sql)
  #   members_first_name_alphabetical = map_items(member_data)
  #   return members_first_name_alphabetical
  # end

  def pretty_name
    return "#{@first_name} #{@last_name}"
  end

  def self.map_items(member_data)
    return member_data.map { |hash| Member.new(hash) }
  end

end
