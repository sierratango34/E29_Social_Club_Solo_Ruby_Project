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

event1 = Event.new({
  "type" => "Karaoke",
  "max_capacity" => 25
  })
event1.save

booking1 = Booking.new({
  "member_id" => member1.id,
  "event_id" => event1.id
  })
booking1.save
