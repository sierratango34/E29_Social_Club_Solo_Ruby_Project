require_relative('../models/member.rb')
require_relative('../models/event.rb')
require_relative('../models/booking.rb')

Booking.delete_all
Member.delete_all
Event.delete_all

member31 = Member.new({
  "first_name" => "Amy",
  "last_name" => "Edwardson"
  })
member31.save

member32 = Member.new({
  "first_name" => "Alasdair",
  "last_name" => "Carstairs"
  })
member32.save

member3 = Member.new({
  "first_name" => "Annabel",
  "last_name" => "Treshansky"
  })
member3.save

member4 = Member.new({
  "first_name" => "Becky",
  "last_name" => "Nielson"
  })
member4.save

member5 = Member.new({
  "first_name" => "Ben",
  "last_name" => "Barker"
  })
member5.save

member6 = Member.new({
  "first_name" => "Charlie",
  "last_name" => "Walker"
  })
member6.save

member7 = Member.new({
  "first_name" => "Colin",
  "last_name" => "Farquhar"
  })
member7.save

member8 = Member.new({
  "first_name" => "Daibhidh",
  "last_name" => "Boyle"
  })
member8.save

member9 = Member.new({
  "first_name" => "Emily",
  "last_name" => "Milne"
  })
member9.save

member10 = Member.new({
  "first_name" => "Eric",
  "last_name" => "Cross"
  })
member10.save

member11 = Member.new({
  "first_name" => "Grant",
  "last_name" => "Rutherford"
  })
member11.save

member12 = Member.new({
  "first_name" => "Jarrod",
  "last_name" => "Bennie"
  })
member12.save

member13 = Member.new({
  "first_name" => "Jennifer",
  "last_name" => "Archibald"
  })
member13.save

member14 = Member.new({
  "first_name" => "Jon",
  "last_name" => "Zarecki"
  })
member14.save

member15 = Member.new({
  "first_name" => "Juan",
  "last_name" => "Mata Ruiz"
  })
member15.save

member16 = Member.new({
  "first_name" => "Pim",
  "last_name" => "Sritawan"
  })
member16.save

member17 = Member.new({
  "first_name" => "Kat",
  "last_name" => "Kiernan"
  })
member17.save

member18 = Member.new({
  "first_name" => "Katharina",
  "last_name" => "Bitzan"
  })
member18.save

member19 = Member.new({
  "first_name" => "Keith",
  "last_name" => "Douglas"
  })
member19.save

member20 = Member.new({
  "first_name" => "Lidia",
  "last_name" => "Stopinska"
  })
member20.save

member21 = Member.new({
  "first_name" => "Louise",
  "last_name" => "Camlin"
  })
member21.save

member22 = Member.new({
  "first_name" => "Maria",
  "last_name" => "Toscano"
  })
member22.save

member23 = Member.new({
  "first_name" => "Mark",
  "last_name" => "King"
  })
member23.save

member24 = Member.new({
  "first_name" => "Mateusz",
  "last_name" => "Stanczak"
  })
member24.save

member25 = Member.new({
  "first_name" => "Myriam",
  "last_name" => "Boran"
  })
member25.save

member26 = Member.new({
  "first_name" => "Pawel",
  "last_name" => "Orzechowski"
  })
member26.save

member27 = Member.new({
  "first_name" => "Robert",
  "last_name" => "Marshall"
  })
member27.save

member28 = Member.new({
  "first_name" => "Roro",
  "last_name" => "Tarantino"
  })
member28.save

member29 = Member.new({
  "first_name" => "Stephen",
  "last_name" => "Gibson"
  })
member29.save

member30 = Member.new({
  "first_name" => "Tony",
  "last_name" => "Goncalves"
  })
member30.save




###########EVENT##########################################################

event1 = Event.new({
  "type" => "Karaoke",
  "max_capacity" => 31
  })
event1.save

##########BOOKING########################################################

booking1 = Booking.new({
  "member_id" => member31.id,
  "event_id" => event1.id
  })
booking1.save

booking32 = Booking.new({
  "member_id" => member32.id,
  "event_id" => event1.id
  })
booking32.save

booking2 = Booking.new({
  "member_id" => member3.id,
  "event_id" => event1.id
  })
booking2.save

booking3 = Booking.new({
  "member_id" => member4.id,
  "event_id" => event1.id
  })
booking3.save

booking4 = Booking.new({
  "member_id" => member5.id,
  "event_id" => event1.id
  })
booking4.save

booking5 = Booking.new({
  "member_id" => member6.id,
  "event_id" => event1.id
  })
booking5.save

booking6 = Booking.new({
  "member_id" => member7.id,
  "event_id" => event1.id
  })
booking6.save

booking7 = Booking.new({
  "member_id" => member8.id,
  "event_id" => event1.id
  })
booking7.save

booking8 = Booking.new({
  "member_id" => member9.id,
  "event_id" => event1.id
  })
booking8.save

booking9 = Booking.new({
  "member_id" => member10.id,
  "event_id" => event1.id
  })
booking9.save

booking10 = Booking.new({
  "member_id" => member11.id,
  "event_id" => event1.id
  })
booking10.save

booking11 = Booking.new({
  "member_id" => member12.id,
  "event_id" => event1.id
  })
booking11.save

booking12 = Booking.new({
  "member_id" => member13.id,
  "event_id" => event1.id
  })
booking12.save

booking13 = Booking.new({
  "member_id" => member14.id,
  "event_id" => event1.id
  })
booking13.save

booking14 = Booking.new({
  "member_id" => member15.id,
  "event_id" => event1.id
  })
booking14.save

booking15 = Booking.new({
  "member_id" => member16.id,
  "event_id" => event1.id
  })
booking15.save

booking16 = Booking.new({
  "member_id" => member17.id,
  "event_id" => event1.id
  })
booking16.save

booking17 = Booking.new({
  "member_id" => member19.id,
  "event_id" => event1.id
  })
booking17.save

booking18 = Booking.new({
  "member_id" => member20.id,
  "event_id" => event1.id
  })
booking18.save

booking19 = Booking.new({
  "member_id" => member21.id,
  "event_id" => event1.id
  })
booking19.save

booking20 = Booking.new({
  "member_id" => member22.id,
  "event_id" => event1.id
  })
booking20.save

booking21 = Booking.new({
  "member_id" => member23.id,
  "event_id" => event1.id
  })
booking21.save

booking22 = Booking.new({
  "member_id" => member24.id,
  "event_id" => event1.id
  })
booking22.save

booking23 = Booking.new({
  "member_id" => member25.id,
  "event_id" => event1.id
  })
booking23.save

booking25 = Booking.new({
  "member_id" => member18.id,
  "event_id" => event1.id
  })
booking25.save

booking26 = Booking.new({
  "member_id" => member26.id,
  "event_id" => event1.id
  })
booking26.save

booking27 = Booking.new({
  "member_id" => member27.id,
  "event_id" => event1.id
  })
booking27.save

booking28 = Booking.new({
  "member_id" => member28.id,
  "event_id" => event1.id
  })
booking28.save

booking29 = Booking.new({
  "member_id" => member29.id,
  "event_id" => event1.id
  })
booking29.save

booking30 = Booking.new({
  "member_id" => member30.id,
  "event_id" => event1.id
  })
booking30.save
