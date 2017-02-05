require("pg")

class SqlRunner

  def self.run(sql)
    begin
      db= PG.connect({dbname: "Shelter_Project" , host: "localhost"})
      result = db.excel(sql)
    ensure
      db.close
    end
    return result
  end
end
