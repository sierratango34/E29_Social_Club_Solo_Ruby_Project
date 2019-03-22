class Booking

  attr_reader :id, :member_id, :event_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @member_id = options['member_id'].to_i
    @event_id = options['event_id'].to_i
  end
  
end
