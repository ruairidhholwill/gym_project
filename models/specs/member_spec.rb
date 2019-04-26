require('minitest/autorun')
require('minitest/rg')
require_relative('../member.rb')

class TestMember < MiniTest::Test


  def setup
    options = {'id' => 1, 'first_name' => 'Ruairidh', 'last_name' => 'Holwill', 'membership_type' => 'Standard'}

    @member = Member.new(options)
  end

  def test_first_name()
    result = @member.first_name()
    assert_equal('Ruairidh', result)
  end

  def test_last_name()
    result = @member.last_name()
    assert_equal('Holwill', result)
  end

  def test_full_name
    result = @member.full_name()
    assert_equal('Ruairidh Holwill', result)
  end

  def test_membership_type()
    result = @member.membership_type()
    assert_equal('Standard', result)
  end


end
