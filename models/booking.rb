require_relative('../db/sql_runner')
require_relative('member')
require_relative('event')

class Booking

  attr_reader :id
  attr_accessor :member_id, :event_id, :confirmed, :paid

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @member_id = options['member_id'].to_i
    @event_id = options['event_id'].to_i
    @confirmed = (options['confirmed'] == 't') ? true : false
    @paid = (options['paid'] == 't') ? true : false
  end

  #CRUD actions
  def save()
    sql = 'INSERT INTO bookings (member_id, event_id, confirmed, paid) VALUES ($1, $2, $3, $4) RETURNING id'
    values = [@member_id, @event_id, @confirmed, @paid]
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
    sql = 'UPDATE bookings SET (member_id, event_id, paid) = ($1, $2, $3) WHERE id = $4'
    values = [@member_id, @event_id, @paid, @id]
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

  def confirm_booking
    sql = 'UPDATE bookings
    SET confirmed = true
    WHERE id = $1
    RETURNING *'
    values = [@id]
    bookings_confirmed_data = SqlRunner.run(sql, values).first
    bookings_confirmed = Booking.new(bookings_confirmed_data)
  end

  def all_bookings_for_event
    sql = 'SELECT * FROM bookings WHERE bookings.event_id = $1'
    values = [@event_id]
    all_confirmed_bookings = SqlRunner.run(sql, values)
    return all_confirmed_bookings
  end

  def all_bookings_for_event_count
    sql = 'SELECT * FROM bookings WHERE bookings.event_id = $1'
    values = [@event_id]
    all_confirmed_bookings = SqlRunner.run(sql, values)
    return all_confirmed_bookings.count
  end

  def all_confirmed_bookings_for_event
    sql = 'SELECT * FROM bookings WHERE bookings.event_id = $1 AND bookings.confirmed = true'
    values = [@event_id]
    all_confirmed_bookings = SqlRunner.run(sql, values)
    return all_confirmed_bookings
  end

  def all_confirmed_bookings_for_event_count
    sql = 'SELECT * FROM bookings WHERE bookings.event_id = $1 AND bookings.confirmed = true'
    values = [@event_id]
    all_confirmed_bookings = SqlRunner.run(sql, values)
    return all_confirmed_bookings.count
  end

  def get_member_object_id_from_id
    sql = 'SELECT members.id FROM members INNER JOIN bookings ON bookings.member_id = members.id WHERE bookings.member_id = $1'
    values = [@member_id]
    the_member_id = SqlRunner.run(sql, values).first
    return Member.find(the_member_id)
  end

  def confirm_payment
    sql = 'UPDATE bookings
    SET paid = true
    WHERE id = $1
    RETURNING *'
    values = [@id]
    bookings_confirmed_data = SqlRunner.run(sql, values).first
    bookings_confirmed = Booking.new(bookings_confirmed_data)
  end

  def get_all_paid_bookings
    sql = 'SELECT * FROM bookings WHERE bookings.paid = true AND bookings.confirmed = true WHERE bookings.event_id = $1'
    values = [@event_id]
    paid_bookings = SqlRunner.run(sql, values)
    return paid_bookings
  end

  def get_all_paid_bookings_count
    sql = 'SELECT * FROM bookings WHERE bookings.paid = true AND bookings.confirmed = true WHERE bookings.event_id = $1'
    values = [@event_id]
    paid_bookings = SqlRunner.run(sql, values)
    return paid_bookings.count
  end
end
