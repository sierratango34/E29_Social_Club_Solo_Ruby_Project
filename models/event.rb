class Event

  attr_reader :type, :number_attending, :max_capacity, :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @type = options['type']
    @number_attending = options['number_attending'].to_i
    @max_capacity = options['max_capacity'].to_i
  end

end
