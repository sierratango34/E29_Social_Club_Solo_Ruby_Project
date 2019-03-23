require('sinatra')
require( 'sinatra/contrib/all' )
require_relative('controllers/members_controller')
require_relative('controllers/events_controller')
require_relative('controllers/bookings_controller')

get '/e29-social-club' do
  erb(:index)
end
