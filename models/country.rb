require_relative('../db/sql_runner')
require_relative('city.rb')

class Country

attr_accessor( :id, :name, :visited, :picture)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @visited = options['visited']
    @picture = options['picture']
  end

  def save()
    sql = "INSERT INTO countries (name, visited) VALUES ($1, $2) RETURNING id;"
    values = [@name, @visited]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE countries SET (name, visited, picture) = ($1, $2, $3) WHERE id = $4;"
    values = [@name, @visited, @picture, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM countries
    WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def find_cities()
    sql = "SELECT * FROM cities WHERE country_id = $1;"
    values = [@id]
    result = SqlRunner.run(sql, values)
    cities = City.map_items(result)
    return cities
  end

  def toggle_visited(input)
    sql = "UPDATE countries SET visited = $1 WHERE id = $2;"
    values = [input, @id]
    SqlRunner.run(sql, values)
  end

  def visited_string()
    if (@visited == "t")
      return "Visited!"
    else
      return "Not Been Yet"
    end
  end

  def visited_string_opposite()
    if (@visited == "f")
      return "Visited!"
    else
      return "Not Been Yet"
    end
  end

  def self.map_items(country_data)
    return country_data.map { |country| Country.new(country)}
  end

  def self.all()
    sql = "SELECT * FROM countries;"
    country_data = SqlRunner.run(sql)
    countries = map_items(country_data)
    return countries
  end

  def self.find(id)
    sql = "SELECT * FROM countries
    WHERE id = $1;"
    values = [id]
    result = SqlRunner.run(sql, values).first
    country = Country.new(result)
    return country
  end

  def self.find_all_visited()
    sql = "SELECT * FROM countries WHERE visited = $1;"
    values = ["t"]
    country_data = SqlRunner.run(sql, values)
    visited_countries = map_items(country_data)
    return visited_countries
  end

  def self.find_all_not_visited()
    sql = "SELECT * FROM countries WHERE visited = $1;"
    values = ["f"]
    country_data = SqlRunner.run(sql, values)
    visited_countries = map_items(country_data)
    return visited_countries
  end

  def self.delete_all()
    sql = "DELETE FROM countries;"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM countries
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end





end
