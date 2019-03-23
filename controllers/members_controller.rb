require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/members')
also_reload('../models/members')

get '/members' do
  @members = Member.all
  erb(:"members/index")
end
