require_relative('../models/member.rb')
require_relative('../models/event.rb')
require_relative('../models/booking.rb')

Booking.delete_all
Member.delete_all
Event.delete_all

member1 = Member.new({
  "first_name" => "Pim",
  "last_name" => "Sritawan"
  })
member1.save

member2 = Member.new({
  "first_name" => "Amy",
  "last_name" => "Anderson"
  })
member2.save

member3 = Member.new({
  "first_name" => "Chloe",
  "last_name" => "Carter"
  })
member3.save

member4 = Member.new({
  "first_name" => "William",
  "last_name" => "Morton"
  })
member4.save

member5 = Member.new({
  "first_name" => "Ben",
  "last_name" => "Walker"
  })
member5.save

member6 = Member.new({
  "first_name" => "Charlie",
  "last_name" => "Gibson"
  })
member6.save

member7 = Member.new({
  "first_name" => "Michael",
  "last_name" => "Rutherford"
  })
member7.save

member8 = Member.new({
  "first_name" => "Ruaridh",
  "last_name" => "MacDonald"
  })
member8.save

member9 = Member.new({
  "first_name" => "Emma",
  "last_name" => "Myers"
  })
member9.save

member10 = Member.new({
  "first_name" => "Chris",
  "last_name" => "Cross"
  })
member10.save

###########EVENT##########################################################

event1 = Event.new({
  "type" => "Karaoke",
  "max_capacity" => 8
  })
event1.save

event2 = Event.new({
  "type" => "Laser Tag",
  "max_capacity" => 5
  })
event2.save

##########BOOKING########################################################

booking1 = Booking.new({
  "member_id" => member1.id,
  "event_id" => event1.id
  })
booking1.save

booking2 = Booking.new({
  "member_id" => member2.id,
  "event_id" => event1.id
  })
booking2.save

booking3 = Booking.new({
  "member_id" => member3.id,
  "event_id" => event1.id
  })
booking3.save

booking4 = Booking.new({
  "member_id" => member4.id,
  "event_id" => event1.id
  })
booking4.save

booking5 = Booking.new({
  "member_id" => member5.id,
  "event_id" => event1.id
  })
booking5.save

booking6 = Booking.new({
  "member_id" => member6.id,
  "event_id" => event1.id
  })
booking6.save

booking7 = Booking.new({
  "member_id" => member7.id,
  "event_id" => event1.id
  })
booking7.save

booking8 = Booking.new({
  "member_id" => member1.id,
  "event_id" => event2.id
  })
booking8.save

booking9 = Booking.new({
  "member_id" => member9.id,
  "event_id" => event2.id
  })
booking9.save

booking10 = Booking.new({
  "member_id" => member10.id,
  "event_id" => event2.id
  })
booking10.save

booking11 = Booking.new({
  "member_id" => member4.id,
  "event_id" => event2.id
  })
booking11.save
