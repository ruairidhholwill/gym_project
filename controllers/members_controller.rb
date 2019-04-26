require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/booking.rb')
require_relative('../models/group_class.rb')
require_relative('../models/member.rb')
also_reload('../models/*')

get '/members' do
  @members = Member.all
  @group_classes = GroupClass.all
  @booking = Booking.all
  erb(:"members/index")
end

get '/members/new' do
  erb(:"members/new")
end

get '/members/:id' do
  @member = Member.new(params['id'])
  erb(:"members/show")
end

post '/members' do
  Member.new(params).save
  redirect to '/members'
end
