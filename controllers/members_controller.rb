require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/member')
also_reload('../models/member')

get '/members' do
  @members = Member.all
  erb(:"members/index")
end
