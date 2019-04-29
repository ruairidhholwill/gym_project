require('minitest/autorun')
require('minitest/rg')
require_relative('../group_class.rb')

class TestGroupClass < MiniTest::Test

  def setup
    options = {
      'id' => 1,
      'class_name' => 'HIIT',
      'capacity' => 10,
      'start_at' => '13:00',
      'end_at' => '15:00',
      'class_date' => '26/04/2019'
    }

    @group_class = GroupClass.new(options)
  end

  def test_class_has_name()
    result = @group_class.class_name()
    assert_equal('HIIT', result)
  end

  def test_class_capacity
    result = @group_class.capacity()
    assert_equal(10, result)
  end

  def test_class_has_a_start_time
    result = @group_class.start_at()
    assert_equal('13:00', result)
  end

  def test_class_has_an_end_time
    result = @group_class.end_at()
    assert_equal('15:00', result)
  end

  def test_class_has_a_date
    result = @group_class.class_date()
    assert_equal('26/04/2019', result)
  end

  def test_date
    result = Date.today.to_s
    assert_equal('2019-04-29', result)
  end

  def test_date_in_future__next_day
    result = @group_class.date_in_future(1)
    assert_equal('2019-04-30', result)
  end















end
