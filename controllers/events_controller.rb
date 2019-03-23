require('sinatra')
require('sinatra/reloader') if development?
require_relative('../models/event')
set :views, Proc.new { File.join(root, "../views") }

get '/e29-social-club/events' do
  @events = Event.all()
  erb(:'events/index')
end
