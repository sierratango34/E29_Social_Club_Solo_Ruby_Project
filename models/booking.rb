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
end
