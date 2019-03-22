class Member

  attr_reader :first_name, :last_name, :attendance_count, :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @attendance_count = options['attendance_count'].to_i
  end





end
