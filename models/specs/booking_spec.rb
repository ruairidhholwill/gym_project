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

# these may fail in future if expected dates not updated
  def test_date
    result = Date.today.to_s
    assert_equal('2019-04-29', result)
  end

  def test_date_tomorrow
    result = (Date.today + 1).to_s
    assert_equal('2019-04-30', result)
  end

end
