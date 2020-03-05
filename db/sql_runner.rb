require( 'pg' )

class SqlRunner

  def self.run( sql, values = [] )
    begin
      db = PG.connect({ dbname: 'da9mir6l0j8fch', host: 'ec2-23-22-156-110.compute-1.amazonaws.com',port: 5432, user: 'sbbifivodlwbpa', password: '727d090a2a9cd4d0329fe278f18b21f9c697b0fba491984363d023c02959c410' })
      db.prepare("query", sql)
      result = db.exec_prepared( "query", values )

      # If running locally again use the below:
      # db = PG.connect({ dbname: 'travucket', host: 'localhost' })
      # db.prepare("query", sql)
      # result = db.exec_prepared( "query", values )
    ensure
      db.close() if db != nil
    end
    return result
  end

end
