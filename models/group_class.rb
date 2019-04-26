require_relative('../db/sql_runner.rb')

class GroupClass

  attr_reader :id, :capacity, :class_name
  attr_accessor :start_at, :end_at, :class_date

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @class_name = options['class_name']
    @capacity = options['capacity'].to_i
    @start_at = options['start_at']
    @end_at = options['end_at']
    @class_date = options['class_date']
  end








end
