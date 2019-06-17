require('pg')

class SqlRunner

  def self.run(sql, values = [])
    begin
      db = PG.connect({dbname: 'da8b25krpgeen0', host: 'ec2-75-101-128-10.compute-1.amazonaws.com', user: 'qaxmdnyxtifrsc', password: '15443c149b2811877b51adb25eba709bcb5b91f6d67b4b076b50343a771aaff8'})
      db.prepare("query", sql)
      result = db.exec_prepared("query", values)
    ensure
      db.close() if db != nil
    end
    return result
  end

end
