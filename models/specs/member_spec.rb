require('minitest/autorun')
require('minitest/rg')
require_relative('../member.rb')

class TestMember < MiniTest::Test

  def setup
    @member1 = Member.new({
      "first_name" => "Pim",
      "last_name" => "Sritawan",
      "attendance_count" => 4
      })
  end

  def test_does_member_class_exist
    assert_equal(Member, @member1.class)
  end

  def test_member_first_name
    assert_equal("Pim", @member1.first_name)
  end

  def test_member_last_name
    assert_equal("Sritawan", @member1.last_name)
  end

  def test_member_attendance_count
    assert_equal(4, @member1.attendance_count)
  end

  def test_increase_attendance_count_method
    assert_equal(5, @member1.increase_attendance_count)
  end

  def test_pretty_name_method
    assert_equal("Pim Sritawan", @member1.pretty_name)
  end
end
