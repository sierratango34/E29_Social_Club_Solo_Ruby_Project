require('sinatra')
require('sinatra/reloader') if development?
require_relative('../models/booking')
require_relative('../models/member')
require_relative('../models/event')

get '/bookings' do
  @bookings = Booking.all()
  erb(:'bookings/index')
end

get '/bookings/new' do
  @booking = Booking.new(params)
  @all_bookings = Booking.all()
  @all_members = Member.all()
  @all_events = Event.all()
  erb(:'bookings/new')
end

###BOOKING PAGE FROM MEMBER ID SHOW.ERB###
get '/bookings/:member_id/new' do
  @booking = Booking.new(params)
  @all_bookings = Booking.all()
  @all_members = Member.all()
  @member_in_question = Member.find(params[:member_id])
  @all_events = Event.all()
  erb(:'bookings/new')
end
##########################################

get '/bookings/:id' do
  @booking = Booking.find(params[:id])
  erb(:'bookings/show')
end

####booking confirmed####
post '/bookings/:id/confirm' do
  @booking = Booking.find(params[:id])
  @booking.confirm_booking
  redirect('/bookings')
end
#########################

####booking paid#########
post '/bookings/:id/paid' do
  @booking = Booking.find(params[:id])
  @booking.confirm_payment
  redirect('/bookings')
end
#########################

post '/bookings' do
  @booking = Booking.new(params)
  @booking.save
  redirect('/bookings')
end

get '/bookings/:id/edit' do
  @booking = Booking.find(params[:id])
  @all_members = Member.all()
  @all_events = Event.all()
  erb(:'bookings/edit')
end

post '/bookings/:id' do
  # Booking.find(params[:id]).update
  Booking.new(params).update
  erb(:'bookings/update')
end

post '/bookings/:id/delete' do
  @booking = Booking.find(params[:id])
  @booking.delete
  erb(:'bookings/delete')
end
