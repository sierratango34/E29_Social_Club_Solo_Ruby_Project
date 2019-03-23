require('sinatra')
require('sinatra/reloader') if development?
require_relative('../models/member')
set :views, Proc.new { File.join(root, "../views") }

get '/members' do #index
  @members = Member.all()
  erb(:'members/index')
end

get '/members/new' do #new
  erb(:'members/new')
end

get '/members/:id' do #show
  @member = Member.find(params[:id])
  erb(:'members/show')
end

# post '/members/' do #create
#
# end
