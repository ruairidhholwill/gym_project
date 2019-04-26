require_relative('../db/sql_runner.rb')

class Member

  attr_reader :id
  attr_accessor :first_name, :last_name, :membership_type

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @membership_type = options['membership_type']
  end









end
