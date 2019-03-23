require('sinatra')
require('sinatra/reloader') if development?
require_relative('../models/member')
set :views, Proc.new { File.join(root, "../views") }

get '/e29-social-club/members' do #index
  @members = Member.all()
  erb(:'members/index')
end

get '/e29-social-club/members/new' do #new
  erb(:'members/new')
end

get '/e29-social-club/members/:id' do #show
  @member = Member.find(params[:id])
  erb(:'members/show')
end

post '/e29-social-club/members' do #create
  @member = Member.new(params)
  @member.save()
  erb(:'members/create')
end

get '/e29-social-club/members/:id/edit' do #edit 
  @member = Member.find(params['id'])
  erb(:'members/edit')
end
