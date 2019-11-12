require_relative('../models/country.rb')
require_relative('../models/city.rb')
require("pry-byebug")

City.delete_all()
Country.delete_all()

country1 = Country.new({"name" => "Scotland", "visited" => true, "picture" => "https://images.spot.im/v1/production/xnpwkbzmahqkxfryfwnm"})
country2 = Country.new({"name" => "Japan", "visited" => false, "picture" => "https://d36tnp772eyphs.cloudfront.net/blogs/1/2011/05/japan-1200x729.jpg"})
country3 = Country.new({"name" => "Canada", "visited" => true, "picture" => "https://baronmag.ca/.image/t_share/MTU1MjcwOTc1ODU4OTQzOTk0/very-majestic-and-beautiful-landscape-with-mountains-in-banff-national-park-alberta-canada.jpg"})

country1.save()
country2.save()
country3.save()


city1 = City.new({"name" => "Edinburgh", "visited" => true, "country_id" => country1.id, "picture" => "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQyrQ_usAIwxUgQhsV4qhQWvkCKyutnCT_gUL2XlxyFjb4QA9HI&s"})

city2 = City.new({"name" => "Osaka", "visited" => false, "country_id" => country2.id, "picture" => "https://cdn-02.herald.ie/lifestyle/article38496275.ece/42bbd/AUTOCROP/w620/osaka.JPG"})

city3 = City.new({"name" => "Tokyo", "visited" => false, "country_id" => country2.id, "picture" => "https://static.coindesk.com/wp-content/uploads/2019/01/shutterstock_1012724596-860x430.jpg"})

city4 = City.new({"name" => "Kyoto", "visited" => false, "country_id" => country2.id, "picture" => "https://cdn.thecrazytourist.com/wp-content/uploads/2018/05/ccimage-shutterstock_776730046.jpg"})

city5 = City.new({"name" => "Toronto", "visited" => true, "country_id" => country3.id, "picture" => "https://www.nationalgeographic.com/content/dam/travel/Guide-Pages/north-america/toronto-travel.adapt.1900.1.jpg"})

city6 = City.new({"name" => "Quebec City", "visited" => true, "country_id" => country3.id, "picture" => "https://img.theculturetrip.com/768x432/wp-content/uploads/2017/09/shutterstock_564217231.jpg"})

city1.save()
city2.save()
city3.save()
city4.save()
city5.save()
city6.save()


binding.pry
nil
