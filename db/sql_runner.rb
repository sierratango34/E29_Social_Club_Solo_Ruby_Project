require( 'pg' )

class SqlRunner
  def self.run( sql, values = [] )
    begin
      # db = PG.connect({ dbname: 'e29_social_club', host: 'localhost' })
      db = PG.connect({dbname: ENV['DBNAME'],
        host: ENV['DBHOST'],
        port: ENV['DBPORT'],
        user: ENV['DBUSER'],
        password: ENV['DBPASSWORD']})
      db.prepare("query", sql)
      result = db.exec_prepared( "query", values )
    ensure
      db.close() if db != nil
    end
    return result
  end

end
