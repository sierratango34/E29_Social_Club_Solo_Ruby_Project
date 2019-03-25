require('sinatra')
require('sinatra/reloader') if development?
require_relative('../models/member')
set :views, Proc.new { File.join(root, "../views") }

get '/e29-social-club/members' do #index
  @members = Member.all()
  erb(:'members/index')
end

# get '/e29-social-club/members-first-name-alphabetical' do
#   @members = Member.all_alphabetical_by_first_name
#   erb(:'members/index-first-name-alphabetical')
# end

get '/e29-social-club/members/new' do #new
  erb(:'members/new')
end

get '/e29-social-club/members/:id' do #show
  @member = Member.find(params[:id])
  @events_and_id = @member.events_attending_and_their_booking_ids
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

post '/e29-social-club/members/:id' do #update
  Member.new(params).update
  erb(:'members/update')
end

post '/e29-social-club/members/:id/delete' do #delete
  @member = Member.find(params['id'])
  @member.delete
  erb(:'members/delete')
end
