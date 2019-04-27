require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/booking.rb')
require_relative('../models/group_class.rb')
require_relative('../models/member.rb')
also_reload('../models/*')

get '/bookings' do
  @bookings = Booking.all
  @members = Member.all
  @group_classes = GroupClass.all
  erb(:"bookings/index")
end

get '/bookings/new' do
  @members = Member.all
  @group_classes = GroupClass.all
  erb(:"bookings/new")
end

post '/bookings' do
  Booking.new(params).save
  redirect to '/bookings'
end
