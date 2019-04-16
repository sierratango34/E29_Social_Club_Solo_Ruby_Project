require( 'pg' )

class SqlRunner
  # original link for localhost
  # def self.run( sql, values = [] )
  #   begin
  #     db = PG.connect({ dbname: 'e29_social_club', host: 'localhost' })
  #     db.prepare("query", sql)
  #     result = db.exec_prepared( "query", values )
  #   ensure
  #     db.close() if db != nil
  #   end
  #   return result
  # end

  def self.run( sql, values = [] )
    begin
      db = PG.connect({ dbname: 'd459ec5hh2l4u6', host: 'ec2-54-246-92-116.eu-west-1.compute.amazonaws.com', port: 5432, user: 'btwpibjjsctrfx', password: 'sadlskjadlkjASDAD' })
      db.prepare("query", sql)
      result = db.exec_prepared( "query", values )
    ensure
      db.close() if db != nil
    end
    return result
  end

end
