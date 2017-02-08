require_relative("../db/sql_runner")


class Adoption

  attr_accessor :id, :animal_id, :owner_id

  def initialize(options)
    @id = options["id"].to_i
   @animal_id = options["animal_id"].to_i
   @owner_id = options["owner_id"].to_i
  end

  def save()
    sql = "INSERT INTO adoptions (animal_id, owner_id) VALUES ('#{@animal_id}', '#{@owner_id}') RETURNING id;"
    result = SqlRunner.run(sql).first
    @id = result['id'].to_i
end

def self.all()
 sql = "SELECT * FROM adoptions"
 result = SqlRunner.run(sql)
 
 return result.map{ |options| Adoption.new(options) }
end

def self.find(id)
 sql = "SELECT * FROM adoptions WHERE id = #{id}"
 adoptions = SqlRunner.run(sql)
 result = Adoption.new(adoptions.first)
end

def animal()
  sql = "SELECT * FROM animals a INNER JOIN adoptions adopt ON adopt.animal_id = a.id WHERE a.id = #{@animal_id};"
  result = SqlRunner.run(sql)
  return Animal.new(result.first)
end

def owner()
  sql = "SELECT * FROM owners o INNER JOIN adoptions adopt ON adopt.owner_id = o.id WHERE o.id = #{@owner_id};"
  result = SqlRunner.run(sql)
  return Owner.new(result.first)
end

end
