require('sinatra')
require('sinatra/contrib/all')
require_relative('../travucket.rb')
require_relative('controllers/countries_controller.rb')
require_relative('models/country')
require_relative('models/city')
also_reload('./models/*')

get '/cities/:id' do
  @city = City.find(params['id'])
  erb(:show_city)
end
