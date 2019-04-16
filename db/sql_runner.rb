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
      db = PG.connect({ dbname: 'da7vkvpnrbfie6', host: 'ec2-54-197-239-115.compute-1.amazonaws.com', port: 5432, user: 'mwmwzvhnrlejss', password: 'bf876b095dbfce3dfcd285834b3ee9e76a0a51ffb6be2ef4332940d93584d14f' })
      db.prepare("query", sql)
      result = db.exec_prepared( "query", values )
    ensure
      db.close() if db != nil
    end
    return result
  end

end
