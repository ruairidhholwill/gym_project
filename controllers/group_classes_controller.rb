require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/booking.rb')
require_relative('../models/group_class.rb')
require_relative('../models/member.rb')
also_reload('../models/*')

get '/group_classes' do
  @group_classes = GroupClass.all
  @members = Member.all
  @bookings = Booking.all
  erb(:"group_classes/index")
end

get '/group_classes/:id' do
  @group_class = GroupClass.new(params['id'])
  erb(:"group_classes/show")
end
