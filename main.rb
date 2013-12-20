
require 'sinatra' # Sinatra bundles with this call.
require 'sinatra/reloader'
require 'sinatra/activerecord'

require 'bundler/setup'
Bundler.require(:default)

# ActiveRecord configuration for PSQL.
require_relative 'config/database'

# Inherit ActiveRecord Base Methods.
# Model names need to be singular.
# require_relative 'models/'
# require_relative 'specs/'
# require_relative 'views/'

get '/' do
  p "%DEBUG-I-MAINRB, In Sinatra GET Default (/) Route"
  erb :display
end

