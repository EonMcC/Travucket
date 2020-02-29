require( 'pg' )

class SqlRunner

  def self.run( sql, values = [] )
    begin
      db = PG.connect({ dbname: 'd78q2p4g7bf2ob', host: 'ec2-18-213-176-229.compute-1.amazonaws.com
      ', port: 5432, user: 'aaktqhniicvzhe', password: 'b97ddde4652dd8dc4c5edbb4fca95fee32d7ca0c45479f50ef319ad7534dbe1b' })
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
