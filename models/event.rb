class Event

  attr_reader :type, :number_attending, :max_capacity, :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @type = options['type']
    @number_attending = options['number_attending'].to_i
    @max_capacity = options['max_capacity'].to_i
  end

  def save()
    sql = 'INSERT INTO events (type, number_attending, max_capacity) VALUES ($1, $2, $3) RETURNING id'
    values = [@type, @number_attending, @max_capacity]
    results = SqlRunner.run(sql, values).first
    @id = results['id'].to_i
  end

  def self.all()
    sql = 'SELECT * FROM events'
    results = SqlRunner.run(sql)
    return results.map { |hash| Event.new(hash) }
  end

  def update()
    sql = 'UPDATE events SET (type, number_attending, max_capacity) = ($1, $2, $3) WHERE id = $4'
    values = [@type, @number_attending, @max_capacity, @id]
    results = SqlRunner(sql, values)

  end
end
