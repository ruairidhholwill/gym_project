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

# results may change if expected date not changed
  def test_date()
    result = Date.today.to_s
    assert_equal('2019-04-30', result)
  end

  def test_date_in_future__next_day()
    result = @group_class.future_date_by_days_ahead(2)
    assert_equal('2019-05-02', result)
  end

  def test_day_of_week_by_num__tuesday_is_2()
    result = @group_class.day_of_week_by_number(0)
    assert_equal(2, result)
  end

  def test_day_of_week_by_num__thursday_is_4()
    result = @group_class.day_of_week_by_number(2)
    assert_equal(4, result)
  end

  def test_day_of_week__if_day_is_today
    result = @group_class.day_of_week(0)
    assert_equal("Tuesday", result)
  end

  def test_day_of_week__if_day_is_3_days_ahead
    result = @group_class.day_of_week(3)
    assert_equal("Friday", result)
  end















end
