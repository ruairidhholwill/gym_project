require('minitest/autorun')
require('minitest/rg')
require_relative('../booking.rb')

class TestBooking < MiniTest::Test

  def setup
    options = {
      'id' => 3,
      'member_id' => 5,
      'group_class_id' => 7
    }

    @booking = Booking.new(options)
  end

  def test_id
    result = @booking.id()
    assert_equal(3, result)
  end

  def test_member_id
    result = @booking.member_id()
    assert_equal(5, result)
  end

  def test_group_class_id
    result = @booking.group_class_id()
    assert_equal(7, result)
  end





end
