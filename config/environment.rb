ENV['SINATRA_ENV'] ||= 'development'

require 'bundler/setup'

Bundler.require(:default, ENV['SINATRA_ENV'])

configure :development do
    set :database, "sqlite3:db/#{ENV['SINATRA_ENV']}.db"
end

require_all 'app'

# ActiveRecord::Base.logger = Logger.new(STDOUT)