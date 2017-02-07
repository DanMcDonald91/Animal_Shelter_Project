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

def self.find(id)
 sql = "SELECT * FROM adoptions WHERE id = #{id}"
 adoptions = SqlRunner.run(sql)
 result = Adoption.new(adoptions.first)
end

end
