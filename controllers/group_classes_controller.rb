require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/booking.rb')
require_relative('../models/group_class.rb')
require_relative('../models/member.rb')
also_reload('../models/*')

get '/group_classes' do
  @group_classes = GroupClass.all_upcoming
  @members = Member.all
  @bookings = Booking.all
  erb(:"group_classes/index")
end

get '/group_classes/history' do
  @group_classes = GroupClass.all_history
  @members = Member.all
  @bookings = Booking.all
  erb(:"group_classes/history")
end

get '/group_classes/new' do
  erb(:"group_classes/new")
end

post '/group_classes' do
  GroupClass.new(params).save
  redirect to '/group_classes'
end

get '/group_classes/:id' do
  @members = GroupClass.find(params['id']).members
  @group_class = GroupClass.find(params['id'])
  erb(:"group_classes/show")
end

get '/group_classes/:id/edit' do
  @group_class = GroupClass.find(params['id'])
  erb(:"group_classes/edit")
end

post '/group_classes/:id' do
  group_class = GroupClass.new(params)
  group_class.update()
  redirect to "/group_classes/#{params['id']}"
end

post '/group_classes/:id/delete' do
  group_class = GroupClass.find(params['id'])
  group_class.delete()
  redirect to '/group_classes'
end
