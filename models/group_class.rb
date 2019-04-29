require_relative('../db/sql_runner.rb')
require_relative('member.rb')
require_relative('booking.rb')

class GroupClass

  attr_reader :id
  attr_accessor :class_name, :capacity, :start_at, :end_at, :class_date

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @class_name = options['class_name']
    @capacity = options['capacity'].to_i
    @start_at = options['start_at']
    @end_at = options['end_at']
    @class_date = options['class_date']
  end

  def save()
    sql = "INSERT INTO group_classes (class_name, capacity, start_at, end_at, class_date) VALUES ($1, $2, $3, $4, $5) RETURNING id;"
    values = [@class_name, @capacity, @start_at, @end_at, @class_date]
    result = SqlRunner.run(sql, values)
    @id = result.first['id'].to_i
  end

  def update()
    sql = "UPDATE group_classes SET (class_name, capacity, start_at, end_at, class_date) = ($1, $2, $3, $4, $5) WHERE id = $6;"
    values = [@class_name, @capacity, @start_at, @end_at, @class_date, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM group_classes WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def members()
    sql = "SELECT members.* FROM members INNER JOIN bookings ON bookings.member_id = members.id INNER JOIN group_classes ON bookings.group_class_id  = group_classes.id WHERE group_class_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |member| Member.new(member) }
  end

  def check_attendance()
    sql = "SELECT members.* FROM members INNER JOIN bookings ON bookings.member_id = members.id INNER JOIN group_classes ON bookings.group_class_id  = group_classes.id WHERE group_class_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.count
  end

  def remaining_spaces()
    spaces = @capacity.to_i - check_attendance()
    return spaces.to_i
  end

  def class_is_full()
    if remaining_spaces <= 0
      return true
    else
      return false
    end
  end

  def off_peak_class()
    if @start_at.between?("11:00", "15:00")
      return true
    else
      return false
    end
  end

  def self.all()
    sql = "SELECT * FROM group_classes;"
    group_class_data = SqlRunner.run(sql)
    group_classes = map_items(group_class_data)
    return group_classes
  end

  def self.all_upcoming()
    sql = "SELECT * FROM group_classes WHERE class_date >= CURRENT_DATE ORDER BY class_date ASC, start_at ASC;"
    group_class_data = SqlRunner.run(sql)
    group_classes = map_items(group_class_data)
    return group_classes
  end

  def self.all_history()
    sql = "SELECT * FROM group_classes WHERE class_date < CURRENT_DATE ORDER BY class_date ASC, start_at ASC;"
    group_class_data = SqlRunner.run(sql)
    group_classes = map_items(group_class_data)
    return group_classes
  end

  def self.find(id)
    sql = "SELECT * FROM group_classes WHERE id = $1;"
    values = [id]
    result = SqlRunner.run(sql, values).first
    group_class = GroupClass.new(result)
    return group_class
  end

  def self.delete_all
    sql = "DELETE FROM group_classes;"
    SqlRunner.run(sql)
  end

  def self.map_items(group_class_data)
    return group_class_data.map { |group_class| GroupClass.new(group_class) }
  end

end
