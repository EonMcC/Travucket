require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/country')
require_relative('../models/city')
