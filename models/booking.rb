require_relative('../db/sql_runner')
require_relative('member.rb')
require_relative('group_class.rb')


class Booking

  attr_reader :id, :member_id, :group_class_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @member_id = options['member_id'].to_i
    @group_class_id = options['group_class_id'].to_i
  end

  def save()
    sql = "INSERT INTO bookings (member_id, group_class_id) VALUES ($1, $2) RETURNING id;"
    values = [@member_id, @group_class_id]
    result = SqlRunner.run(sql, values)
    @id = result.first['id'].to_i
  end

  def update()
    sql = "UPDATE bookings SET (member_id, group_class_id) = ($1, $2) WHERE id = $3;"
    values = [@member_id, @group_class_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM bookings WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def member()
    sql = "SELECT * FROM members WHERE id = $1;"
    values = [@member_id]
    results = SqlRunner.run(sql, values)
    return Member.new(results.first)
  end

  def group_class()
    sql = "SELECT * FROM group_classes WHERE id = $1;"
    values = [@group_class_id]
    results = SqlRunner.run(sql, values)
    return GroupClass.new(results.first)
  end

  def self.all()
    sql = "SELECT * FROM bookings;"
    booking_data = SqlRunner.run(sql)
    bookings = map_items(booking_data)
    return bookings
  end
  
  def self.find(id)
    sql = "SELECT * FROM bookings WHERE id = $1;"
    values = [id]
    result = SqlRunner.run(sql, values).first
    booking = Booking.new(result)
    return booking
  end

  def self.delete_all()
    sql = "DELETE FROM bookings;"
    SqlRunner.run(sql)
  end

  def self.map_items(booking_data)
    return booking_data.map { |booking| Booking.new(booking) }
  end

end
