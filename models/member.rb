class Member

  attr_reader :first_name, :last_name, :attendance_count, :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @attendance_count = options['attendance_count'].to_i
  end

  def save()
    sql = 'INSERT INTO members (first_name, last_name, attendance_count) VALUES ($1, $2, $3) RETURNING id'
    values = [@first_name, @last_name, @attendance_count]
    results = SqlRunner.run(sql, values).first
    @id = results['id'].to_i
  end

  def self.all
    sql = 'SELECT * FROM members'
    results = SqlRunner.run(sql)
    return results.map { |hash| Member.new(hash) }
  end
end
