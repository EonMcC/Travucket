require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/cities_controller.rb')
require_relative('controllers/countries_controller.rb')
require_relative('models/country')
require_relative('models/city')
also_reload('./models/*')

get '/' do
  @country = Country.all()
  @city = City.all()
  erb(:index)
end

get '/cities/:id' do
  @city = City.find(params['id'])
  erb(:"cities/show")
end

get '/visited' do
  @visited_countries = Country.find_all_visited()
  @city = City.all()
  erb(:"countries/visited")
end

get '/not-visited' do
  @not_visited_countries = Country.find_all_not_visited()
  @city = City.all()
  erb(:"countries/not-visited")
end

# get '/add-country' do
#   @cities = City.all
#   erb(:'countries/new')
# end
