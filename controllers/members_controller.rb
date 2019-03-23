require('sinatra')
require('sinatra/reloader') if development?
require_relative('../models/member')
set :root, File.dirname(solo_ruby_project)

get '/members' do
  @members = Member.all()
  erb(:'members/index')
end
