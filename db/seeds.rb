require_relative('../models/member.rb')
require_relative('../models/event.rb')
require_relative('../models/booking.rb')

Booking.delete_all
Member.delete_all
Event.delete_all

member1 = Member.new({
  "first_name" => "Pim",
  "last_name" => "Sritawan",
  "attendance_count" => 4
  })
member1.save

member2 = Member.new({
  "first_name" => "Charlie",
  "last_name" => "Walker",
  "attendance_count" => 4
  })
member2.save

member3 = Member.new({
  "first_name" => "Katharina",
  "last_name" => "Bitzan",
  "attendance_count" => 3
  })
member3.save

member4 = Member.new({
  "first_name" => "Grant",
  "last_name" => "Rutherford",
  "attendance_count" => 4
  })
member4.save

event1 = Event.new({
  "type" => "karaoke",
  "number_attending" => 0,
  "max_capacity" => 25
  })
event1.save

event2 = Event.new({
  "type" => "pub quiz",
  "number_attending" => 0,
  "max_capacity" => 6
  })
event2.save

event3 = Event.new({
  "type" => "bowling",
  "number_attending" => 0,
  "max_capacity" => 5
  })
event3.save

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
  "event_id" => event2.id
  })
booking3.save

booking4 = Booking.new({
  "member_id" => member4.id,
  "event_id" => event2.id
  })
booking4.save

booking5 = Booking.new({
  "member_id" => member1.id,
  "event_id" => event3.id
  })
booking5.save

booking6 = Booking.new({
  "member_id" => member2.id,
  "event_id" => event3.id
  })
booking6.save
