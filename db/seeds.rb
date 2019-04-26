require_relative('../models/booking.rb')
require_relative('../models/group_class.rb')
require_relative('../models/member.rb')
require('pry-byebug')

Booking.delete_all()
Member.delete_all()
GroupClass.delete_all()

def make_member(first_name, last_name, membership_type)
  new_member = Member.new( {
    'first_name' => first_name,
    'last_name' => last_name,
    'membership_type' => membership_type
    } )
  new_member.save()
  return new_member
end

member1 = make_member('Ruairidh', 'Holwill', 'Standard')
member2 = make_member('Chris', 'Mitchell', 'Standard')
member1 = make_member('Connie', 'Begg', 'Premium')

def make_group_class(class_name, capacity, start_at, end_at, class_date)
    new_group_class = GroupClass.new( {
      'class_name' => class_name,
      'capacity' => capacity,
      'start_at' => start_at,
      'end_at' => end_at,
      'class_date' => class_date
      } )
    new_group_class.save()
    return new_group_class
end

group_class1 = make_group_class('HIIT', 10, '09:00', '10:00', '26/04/2019')
group_class2 = make_group_class('Gymnastics', 15, '13:00', '15:00', '26/04/2019')

def make_booking(member_id, group_class_id)
  new_booking = Booking.new( {
    'member_id' => member_id,
    'group_class_id' => group_class_id
    } )
  new_booking.save()
  return new_booking
end

booking1 = make_booking(member1.id, group_class1.id)


# testing if member update function works
# member1.membership_type = 'Pro'
# member1.update()
#
#
# binding.pry
# nil
