require('sinatra')
require('sinatra/reloader') if development?
require_relative('../models/event')

get '/events' do
  @events = Event.all()
  @events = Event.search_by_type(params['type']) if (params['type'])
  erb(:'events/index')
end

get '/events/new' do
  erb(:'events/new')
end

get '/events/:id' do
  @event = Event.find(params[:id])
  erb(:'events/show')
end

post '/events' do
  @event = Event.new(params)
  @event.save
  redirect('/events')
end

get '/events/:id/edit' do
  @event = Event.find(params[:id])
  erb(:'events/edit')
end

post '/events/:id' do
  Event.new(params).update
  erb(:'events/update')
end

post '/events/:id/delete' do
  @event = Event.find(params[:id])
  @event.delete
  erb(:'events/delete')
end
