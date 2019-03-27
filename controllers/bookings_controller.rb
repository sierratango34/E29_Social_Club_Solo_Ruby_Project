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
  @all_bookings = Booking.all()
  @all_members = Member.all()
  @all_events = Event.all()
  erb(:'bookings/new')
end

get '/e29-social-club/bookings/:id' do
  @booking = Booking.find(params[:id])
  erb(:'bookings/show')
end

####booking confirmed####
post '/e29-social-club/bookings/:id/confirm' do
  @booking = Booking.find(params[:id])
  @booking.confirm_booking
  erb(:'bookings/confirm')
end
#########################

post '/e29-social-club/bookings' do
  @booking = Booking.new(params)
  @booking.save
  erb(:'bookings/create')
end

# ###SAVE NEW BOOKING IF LESS THAN MAX CAPACITY ###
# post '/e29-social-club/bookings' do
#   @booking = Booking.new(params)
#   @booking_event_id = @booking.event_id
#   @event = Event.find(@booking_event_id)
#   @booking.save_if_bookings_is_less_than_event_max_capacity(@event.id)
#   erb(:'bookings/create')
# end
# #################################################

get '/e29-social-club/bookings/:id/edit' do
  @booking = Booking.find(params[:id])
  @all_members = Member.all()
  @all_events = Event.all()
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
