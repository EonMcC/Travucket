require_relative('../db/sql_runner')
require_relative('city.rb')
require_relative('country.rb')

class Sight

  attr_accessor(:id, :name, :visited, :city_id)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @visited = options['visited']
    @city_id = options['city_id'].to_i
  end

  def save()
    sql = "INSERT INTO sights (name, visited, city_id) VALUES ($1, $2, $3) RETURNING id;"
    values = [@name, @visited, @city_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE sights SET (name, visited, city_id) = ($1, $2, $3) WHERE id = $4;"
    values = [@name, @visited, @country_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM sights
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def find_city()
    city = City.find(@city_id)
    return city
  end

  def find_country()
    city = City.find(Country.find(@country_id))
    return city
  end

  def self.map_items(sight_data)
    return sight_data.map { |sight| Sight.new(sight) }
  end

  def self.all()
    sql = "SELECT * FROM sights;"
    sight_data = SqlRunner.run(sql)
    sights = map_items(sight_data)
    return sights
  end

  def self.delete(id)
    sql = "DELETE FROM sights
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

  def self.delete_all()
    sql = "DELETE FROM sights;"
    SqlRunner.run(sql)
  end

end
