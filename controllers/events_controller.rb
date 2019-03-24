require('sinatra')
require('sinatra/reloader') if development?
require_relative('../models/event')
set :views, Proc.new { File.join(root, "../views") }

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
