class Booking

  attr_reader :id, :member_id, :event_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @member_id = options['member_id'].to_i
    @event_id = options['event_id'].to_i
  end

  def save()
    sql = 'INSERT INTO bookings (member_id, event_id) VALUES ($1, $2) RETURNING id'
    values = [@member_id, @event_id]
    results = SqlRunner.run(sql, values).first
    @id = results['id'].to_i
  end

  def self.all()
    sql = 'SELECT * FROM bookings'
    results = SqlRunner.run(sql)
    return results.map { |hash| Booking.new(hash) }
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

  def self.find(id)
    sql = 'SELECT * FROM bookings WHERE id = $1'
    values = [id]
    booking = SqlRunner.run(sql, values).first
    result = Booking.new(booking)
    return result
  end
end
