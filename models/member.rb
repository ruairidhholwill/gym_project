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

  def full_name()
    return "#{@first_name.capitalize} #{@last_name.capitalize}"
  end

  def save()
    sql = "INSERT INTO members
    (
      first_name,
      last_name,
      membership_type
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id;"
    values = [@first_name, @last_name, @membership_type]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end

  def update()
    sql = "UPDATE members
    SET
    (
      first_name,
      last_name,
      membership_type
    )
    =
    (
      $1, $2, $3
    )
    WHERE id = $4;"
    values = [@first_name, @last_name, @membership_type, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM members WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM members;"
    member_data = SqlRunner.run(sql)
    members = map_items(member_data)
    return members
  end

  def self.find()
    sql = "SELECT * FROM members WHERE id = $1;"
    values = [id]
    result = SqlRunner.run(sql, values).first
    member = Member.new(result)
    return member
  end

  def self.delete_all
    sql = "DELETE FROM members;"
    SqlRunner.run(sql)
  end

  def self.map_items(member_data)
    return member_data.map { |member| Member.new(member) }
  end

end
