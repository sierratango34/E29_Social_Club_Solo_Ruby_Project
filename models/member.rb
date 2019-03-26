require_relative('../db/sql_runner')

class Member

  attr_reader :id
  attr_accessor :first_name, :last_name, :attendance_count

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
    member_data = SqlRunner.run(sql)
    members = map_items(member_data)
    return members
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

  # def self.all_alphabetical_by_first_name
  #   sql = 'SELECT * FROM members ORDER BY first_name'
  #   member_data = SqlRunner.run(sql)
  #   members_first_name_alphabetical = map_items(member_data)
  #   return members_first_name_alphabetical
  # end

  def increase_attendance_count
    @attendance_count += 1
    return @attendance_count.to_i
  end

  def pretty_name
    return "#{@first_name} #{@last_name}"
  end

  def self.map_items(member_data)
    return member_data.map { |hash| Member.new(hash) }
  end
end
