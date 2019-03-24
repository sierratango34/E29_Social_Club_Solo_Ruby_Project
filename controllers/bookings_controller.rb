require('sinatra')
require('sinatra/reloader') if development?
require_relative('../models/booking')
set :views, Proc.new { File.join(root, "../views") }

get '/e29-social-club/bookings' do
  @bookings = Booking.all()
  erb(:'bookings/index')
end
