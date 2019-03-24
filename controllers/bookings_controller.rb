require('sinatra')
require('sinatra/reloader') if development?
require_relative('../models/booking')
require_relative('../models/member')
require_relative('../models/event')
set :views, Proc.new { File.join(root, "../views") }

get '/e29-social-club/bookings' do
  @bookings = Booking.all()
  erb(:'bookings/index')
end

get '/e29-social-club/bookings/new' do
  @booking = Booking.new(params)
  erb(:'bookings/new')
end

get '/e29-social-club/bookings/:id' do
  @booking = Booking.find(params[:id])
  erb(:'bookings/show')
end
