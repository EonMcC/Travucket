require_relative('../models/country.rb')
require_relative('../models/city.rb')
require_relative('../models/sight.rb')
require("pry-byebug")

Sight.delete_all()
City.delete_all()
Country.delete_all()

country1 = Country.new({"name" => "Scotland", "visited" => true, "picture" => "https://www.worldtravelguide.net/wp-content/uploads/2017/03/shu-Scotland-Loch-Awe-Kilchurn-Castle-513939127-1440x823.jpg", "stars" => "4"})
country2 = Country.new({"name" => "Japan", "visited" => false, "picture" => "https://d36tnp772eyphs.cloudfront.net/blogs/1/2011/05/japan-1200x729.jpg"})
country3 = Country.new({"name" => "Canada", "visited" => true, "picture" => "http://www.americanguestusa.com/data/Image/MB-Images%20Web/Canada2.jpg?rev=B079", "stars" => "3"})
country4 = Country.new({"name" => "USA", "visited" => true, "picture" => "https://cdn.pixabay.com/photo/2016/04/18/16/47/usa-1336898_960_720.jpg", "stars" => "4"})
country5 = Country.new({"name" => "Germany", "visited" => true, "picture" => "https://www.globalpartnership.org/sites/default/files/styles/1400x640/public/germany-banner-mobile_0.jpg?itok=zHHAZhm5"})
country6 = Country.new({"name" => "Sweeden", "visited" => false, "picture" => "https://previews.123rf.com/images/mironovak/mironovak1709/mironovak170900025/85198092-flag-of-sweden-or-swedish-flag-on-scratched-rough-texture.jpg"})
country7 = Country.new({"name" => "Peru", "visited" => false, "picture" => "https://cdn1.vectorstock.com/i/1000x1000/51/25/waving-flag-of-peru-vector-24105125.jpg"})

country1.save()
country2.save()
country3.save()
country4.save()
country5.save()
country6.save()
country7.save()


city1 = City.new({"name" => "Edinburgh", "visited" => true, "country_id" => country1.id, "picture" => "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQyrQ_usAIwxUgQhsV4qhQWvkCKyutnCT_gUL2XlxyFjb4QA9HI&s"})

city2 = City.new({"name" => "Osaka", "visited" => false, "country_id" => country2.id, "picture" => "https://cdn-02.herald.ie/lifestyle/article38496275.ece/42bbd/AUTOCROP/w620/osaka.JPG"})

city3 = City.new({"name" => "Tokyo", "visited" => false, "country_id" => country2.id, "picture" => "https://static.coindesk.com/wp-content/uploads/2019/01/shutterstock_1012724596-860x430.jpg"})

city4 = City.new({"name" => "Kyoto", "visited" => false, "country_id" => country2.id, "picture" => "https://cdn.thecrazytourist.com/wp-content/uploads/2018/05/ccimage-shutterstock_776730046.jpg"})

city5 = City.new({"name" => "Toronto", "visited" => false, "country_id" => country3.id, "picture" => "https://www.nationalgeographic.com/content/dam/travel/Guide-Pages/north-america/toronto-travel.adapt.1900.1.jpg"})

city6 = City.new({"name" => "Quebec City", "visited" => true, "country_id" => country3.id, "picture" => "https://img.theculturetrip.com/768x432/wp-content/uploads/2017/09/shutterstock_564217231.jpg"})

city7 = City.new({"name" => "New York", "visited" => true, "country_id" => country4.id, "picture" => "https://dynaimage.cdn.cnn.com/cnn/w_1200/http%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F190503105157-statue-of-liberty-national-park-super-tease.jpg"})

city8 = City.new({"name" => "Seattle", "visited" => false, "country_id" => country4.id, "picture" => "https://images2.minutemediacdn.com/image/upload/c_fill,g_auto,h_1248,w_2220/f_auto,q_auto,w_1100/v1555389675/shape/mentalfloss/istock_000054895092_small.jpg"})

city9 = City.new({"name" => "Valletta", "visited" => false, "country_id" => country5.id, "picture" => "https://adventure.com/wp-content/uploads/2018/01/Hero-Valetta-Malta-Valletta-Waterfront-Photo-credit-Malta-Tourism-1920x1080.jpg"})

city10 = City.new({"name" => "Berlin", "visited" => false, "country_id" => country5.id, "picture" => "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ7scLWIMF6EdFxYj2xKvoSJnZrRXoVrtFv2q2BgwLZ_WLubpKihg&s"})

city1.save()
city2.save()
city3.save()
city4.save()
city5.save()
city6.save()
city7.save()
city8.save()
city9.save()
city10.save()

sight1 = Sight.new({"name" => "Edinburgh Castle", "visited" => true, "city_id" => city1.id})
sight2 = Sight.new({"name" => "Statue of Liberty", "visited" => false, "city_id" => city7.id})
sight3 = Sight.new({"name" => "Central Park", "visited" => true, "city_id" => city7.id})
sight4 = Sight.new({"name" => "Tokyo Tower", "visited" => false, "city_id" => city3.id})
sight5 = Sight.new({"name" => "Starbucks", "visited" => false, "city_id" => city8.id})

sight1.save()
sight2.save()
sight3.save()
sight4.save()
sight5.save()


binding.pry
nil
