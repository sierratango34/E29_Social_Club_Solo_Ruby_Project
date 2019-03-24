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

  # def test_booking_member
  #   assert_equal(@member1, @booking1.member_id)
  # end

  # def test_booking_event
  #   assert_equal(@event1, @booking1.event_id)
  # end
# -----------------------------
  # def test_get_member_pretty_name
  #   assert_equal("Pim Sritawan", @booking1.get_member_pretty_name)
  # end
  # NoMethodError: undefined method `pretty_name' for 0:Integer
  # cannot perform .pretty_name on id, but how do i access the names for the member id?

# -----------------------------
end
