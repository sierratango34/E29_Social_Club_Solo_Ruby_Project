require('sinatra')
require('sinatra/reloader') if development?
require_relative('../models/member')

get '/e29-social-club/members' do #index
  @members = Member.all()
  erb(:'members/index')
end

get '/e29-social-club/members/new' do #new
  erb(:'members/new')
end

get '/e29-social-club/members/:id' do #show
  @member = Member.find(params[:id])
  @confirmed_events_and_id = @member.confirmed_events_attending_and_their_booking_ids
  @events_and_id = @member.events_attending_and_their_booking_ids
  @all_events = @member.events_attending
  erb(:'members/show')
end

post '/e29-social-club/members' do #create
  @member = Member.new(params)
  @member.save()
  redirect('/e29-social-club/members')
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
