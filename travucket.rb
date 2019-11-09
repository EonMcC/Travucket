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

get '/add-country' do
  @cities = City.all
  erb(:'countries/new')
end

post '/add-country' do
  Country.new(params).save
  redirect to '/'
end

get '/add-city/:id' do
  id = (params[:id])
  @country = Country.find(id)
  erb(:'cities/new')
end

post '/add-city' do
  City.new(params).save
  redirect to '/'
end

post '/delete-country/:id' do
  Country.delete(params[:id])
  redirect to ('/')
end

get '/edit/:id' do
  @country = Country.find(params['id'])
  erb(:'countries/edit')
end

post '/edit/:id' do
  country = Country.new(params)
  country.update
  redirect to '/'
end
