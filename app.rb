require('sinatra')
require( 'sinatra/contrib/all' ) if development?
require_relative('controllers/members_controller')
require_relative('controllers/events_controller')
require_relative('controllers/bookings_controller')

get '/' do
  erb(:index)
end
