require('sinatra')
require('sinatra/reloader') if development?
require_relative('../models/member')
set :views, Proc.new { File.join(root, "../views") }

get '/members' do
  @members = Member.all()
  erb(:'members/index')
end
