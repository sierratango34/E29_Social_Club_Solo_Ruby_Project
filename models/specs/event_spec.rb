require('minitest/autorun')
require('minitest/rg')
require_relative('../event.rb')

class TestEvent < MiniTest::Test

  def setup
    @event1 = Event.new({
      "type" => "karaoke",
      "number_attending" => 0,
      "max_capacity" => 25
      })
  end

  def test_event_class_exist
    assert_equal(Event, @event1.class)
  end

  def test_event_type
    assert_equal("karaoke", @event1.type)
  end

  def test_event_number_attending
    assert_equal(0, @event1.number_attending)
  end

  def test_event_max_capacity
    assert_equal(25, @event1.max_capacity)
  end
end
