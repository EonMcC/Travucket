require_relative('../db/sql_runner')

class City

attr_accessor( :id, :name, :visited, :country_id )

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @visited = options['visited']
    @country_id = options['country_id'].to_i
  end

  def save()
    sql = "INSERT INTO cities (name, visited, country_id) VALUES ($1, $2, $3) RETURNING id;"
    values = [@name, @visited, @country_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE cities SET (name, visited, country_id) = ($1, $2, $3) WHERE id = $4;"
    values = [@name, @visited, @country_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM cities
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def find_country()
    country = Country.find(@country_id)
    return country
  end

  def self.map_items(city_data)
    return city_data.map { |city| City.new(city) }
  end

  def self.all()
    sql = "SELECT * FROM cities;"
    city_data = SqlRunner.run(sql)
    cities = map_items(city_data)
    return cities
  end

  def self.find(id)
    sql = "SELECT * FROM cities
    WHERE id = $1;"
    values = [id]
    result = SqlRunner.run(sql, values).first
    city = City.new(result)
    return city
  end

  def self.find_all_visited()
    sql = "SELECT * FROM cities WHERE visited = $1;"
    values = ["t"]
    city_data = SqlRunner.run(sql, values)
    visited_cities = map_items(city_data)
    return visited_cities
  end

  def self.delete_all()
    sql = "DELETE FROM cities;"
    SqlRunner.run(sql)
  end



end