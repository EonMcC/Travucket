require('sinatra')
require('sinatra/contrib/all')
require_relative('../travucket.rb')

require_relative('../models/country')
require_relative('../models/city')
also_reload('./models/*')
