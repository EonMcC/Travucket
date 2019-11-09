require_relative('../models/country.rb')
require_relative('../models/city.rb')
require("pry-byebug")

City.delete_all()
Country.delete_all()

country1 = Country.new({"name" => "Scotland", "visited" => true})
country2 = Country.new({"name" => "Japan", "visited" => false})
country3 = Country.new({"name" => "Canada", "visited" => true})

country1.save()
country2.save()
country3.save()


city1 = City.new({"name" => "Edinburgh", "visited" => true, "country_id" => country1.id})
city2 = City.new({"name" => "Thurso", "visited" => false, "country_id" => country1.id})
city3 = City.new({"name" => "Tokyo", "visited" => false, "country_id" => country2.id})
city4 = City.new({"name" => "Kyoto", "visited" => false, "country_id" => country2.id})
city5 = City.new({"name" => "Toronto", "visited" => true, "country_id" => country3.id})
city6 = City.new({"name" => "Glasgow", "visited" => true, "country_id" => country1.id})

city1.save()
city2.save()
city3.save()
city4.save()
city5.save()
city6.save()


binding.pry
nil
