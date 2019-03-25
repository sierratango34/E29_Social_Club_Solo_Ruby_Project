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
  @all_members = Booking.all_members_available()
  @all_events = Booking.all_events_available()
  erb(:'bookings/new')
end

get '/e29-social-club/bookings/:id' do
  @booking = Booking.find(params[:id])
  erb(:'bookings/show')
end

post '/e29-social-club/bookings' do
  @booking = Booking.new(params)
  @booking.save
  erb(:'bookings/create')
end

get '/e29-social-club/bookings/:id/edit' do
  @booking = Booking.find(params[:id])
  erb(:'bookings/edit')
end

post '/e29-social-club/bookings/:id' do
  Booking.new(params).update
  erb(:'bookings/update')
end

post '/e29-social-club/bookings/:id/delete' do
  @booking = Booking.find(params[:id])
  @booking.delete
  erb(:'bookings/delete')
end
