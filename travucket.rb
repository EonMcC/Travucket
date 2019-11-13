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

get '/country/:id' do
  @country = Country.find(params['id'])
  @city = Country.find_cities(params['id'])
  erb(:'countries/show')
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

post '/delete-city/:id' do
  City.delete(params[:id])
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

get '/edit-city/:id' do
  @city = City.find(params['id'])
  erb(:'cities/edit-city')
end

post '/edit-city/:id' do
  city = City.new(params)
  city.update
  redirect to '/'
end

post '/update_without_pic/:visited/:id' do
  country = Country.new(params)
  country.update_without_pic
  redirect to '/'
end

post '/update_without_pic_visited/:visited/:id' do
  country = Country.new(params)
  country.update_without_pic
  redirect to '/visited'
end

post '/update_without_pic_notvisited/:visited/:id' do
  country = Country.new(params)
  country.update_without_pic
  redirect to '/not-visited'
end



post '/update_city_without_pic/:visited/:country_id/:id' do
  city = City.new(params)
  city.update_city_without_pic()
  redirect to "/country/#{city.country_id}"
end



post '/toggle-country-visited/:visited/:id' do
  Country.toggle_visited(params['visited'], ['id'])
  redirect to '/'
end

post '/toggle-city-visited/:id/:name/:visited/:country_id' do
  country = City.new(params)
  country.update()
  redirect to '/'
end

get '/add-country-picture/:id' do
  @country = Country.find(params['id'])
  erb(:'/countries/add-picture')
end

post '/add-country-picture/:id/:name/:visited' do
  country = Country.new(params)
  country.update()
  redirect to '/'
end

get '/add-city-picture/:id' do
  @city = City.find(params['id'])
  erb(:'/cities/add-city-picture')
end

post '/add-city-picture/:id/:name/:visited/:country_id' do
  city = City.new(params)
  city.update()
  redirect to '/'
end

post '/update-stars/:stars/:id' do
  country = Country.find(params['id'])
  country.update_stars(params['stars'])
  redirect to '/'
end

get '/randomiser' do
  @country = Country.randomiser()
  @city = City.all()
  erb(:'/randomiser')
end
