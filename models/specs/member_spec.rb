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




end
