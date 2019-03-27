require('sinatra')
require('sinatra/reloader') if development?
require_relative('../models/event')

get '/e29-social-club/events' do
  @events = Event.all()
  erb(:'events/index')
end

get '/e29-social-club/events/new' do
  erb(:'events/new')
end

get '/e29-social-club/events/:id' do
  @event = Event.find(params[:id])
  erb(:'events/show')
end

post '/e29-social-club/events' do
  @event = Event.new(params)
  @event.save
  erb(:'events/create')
end

get '/e29-social-club/events/:id/edit' do
  @event = Event.find(params[:id])
  erb(:'events/edit')
end

post '/e29-social-club/events/:id' do
  Event.new(params).update
  erb(:'events/update')
end

post '/e29-social-club/events/:id/delete' do
  @event = Event.find(params[:id])
  @event.delete
  erb(:'events/delete')
end
