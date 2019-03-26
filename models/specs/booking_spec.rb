require('minitest/autorun')
require('minitest/rg')
require_relative('../booking.rb')
require_relative('../member.rb')
require_relative('../event.rb')

class TestBooking < MiniTest::Test

  def setup
    @booking1 = Booking.new({
      "member_id" => @member1,
      "event_id" => @event1
      })

    @member1 = Member.new({
      "first_name" => "Pim",
      "last_name" => "Sritawan",
      "attendance_count" => 4
      })

    @event1 = Event.new({
      "type" => "karaoke",
      "number_attending" => 0,
      "max_capacity" => 25
      })
  end

  def test_booking_class_exist
    assert_equal(Booking, @booking1.class)
  end

end
