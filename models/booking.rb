require_relative('../db/sql_runner')

class Booking

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @member_id = options['member_id'].to_i
    @group_class_id = options['group_class_id'].to_i
  end






end
