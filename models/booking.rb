require_relative('../db/sql_runner')
require_relative('member')
require_relative('event')

class Booking

  attr_reader :id
  attr_accessor :member_id, :event_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @member_id = options['member_id'].to_i
    @event_id = options['event_id'].to_i
  end

  #CRUD actions
  def save()
    sql = 'INSERT INTO bookings (member_id, event_id) VALUES ($1, $2) RETURNING id'
    values = [@member_id, @event_id]
    results = SqlRunner.run(sql, values).first
    @id = results['id'].to_i
  end

  def self.all()
    sql = 'SELECT * FROM bookings'
    booking_data = SqlRunner.run(sql)
    bookings = map_items(booking_data)
    return bookings
  end

  def update()
    sql = 'UPDATE bookings SET (member_id, event_id) = ($1, $2) WHERE id = $3'
    values = [@member_id, @event_id, @id]
    results = SqlRunner.run(sql, values)
  end

  def delete()
    sql = 'DELETE FROM bookings WHERE id = $1'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = 'DELETE FROM bookings'
    SqlRunner.run(sql)
  end

  #additional methods
  def self.find(id)
    sql = 'SELECT * FROM bookings WHERE id = $1'
    values = [id]
    booking = SqlRunner.run(sql, values).first
    result = Booking.new(booking)
    return result
  end

  def member
    sql = 'SELECT * FROM members WHERE members.id = $1'
    values = [@member_id]
    member_data = SqlRunner.run(sql, values)
    members = member_data.map { |hash| Member.new(hash)  }
    return members.first()
  end

  def event
    sql = 'SELECT * FROM events WHERE events.id = $1'
    values = [@event_id]
    event_data = SqlRunner.run(sql, values)
    event = event_data.map { |hash| Event.new(hash)  }
    return event.first
  end

  def self.map_items(booking_data)
    return booking_data.map { |hash| Booking.new(hash) }
  end

  def self.all_members_available
    sql = 'SELECT members.* FROM members
    INNER JOIN bookings
    ON bookings.member_id = members.id'

    all_members_array = SqlRunner.run(sql)
    hash_of_member_objects = all_members_array.map { |hash| Member.new(hash) }
    return hash_of_member_objects
  end

  def 

  end
  # def get_member_pretty_name
  #   sql = 'SELECT members.* FROM members
  #   INNER JOIN bookings
  #   ON bookings.member_id = members.id
  #   WHERE members.id = $1'
  #   values = [@id]
  #   member_data = SqlRunner.run(sql, values).first
  #   booking_member = member_data.map { |hash| Member.new(hash) }
  #   member = Member.new(booking_member)
  #   return booking_member.get_member_pretty_name
  # end
end
