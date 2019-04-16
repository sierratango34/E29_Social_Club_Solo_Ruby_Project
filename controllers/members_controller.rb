require('sinatra')
require('sinatra/reloader') if development?
require_relative('../models/member')

get '/members' do #index
  @members = Member.all()
  @members = Member.search_by_name(params['first_name']) if (params['first_name'])
  @members = Member.search_by_name(params['last_name']) if (params['last_name'])
  erb(:'members/index')
end

get '/members/new' do #new
  erb(:'members/new')
end

get '/members/:id' do #show
  @member = Member.find(params[:id])
  @confirmed_events_and_id = @member.confirmed_events_attending_and_their_booking_ids
  @events_and_id = @member.events_attending_and_their_booking_ids
  @all_events = @member.events_attending
  erb(:'members/show')
end

post '/members' do #create
  @member = Member.new(params)
  @member.save()
  redirect('/members')
end

get '/members/:id/edit' do #edit
  @member = Member.find(params['id'])
  erb(:'members/edit')
end

post '/members/:id' do #update
  Member.new(params).update
  erb(:'members/update')
end

post '/members/:id/delete' do #delete
  @member = Member.find(params['id'])
  @member.delete
  erb(:'members/delete')
end
