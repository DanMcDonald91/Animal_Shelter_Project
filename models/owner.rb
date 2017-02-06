require_relative("../db/sql_runner")

class Owner

  attr_accessor :id, :full_name, :chosen_animal
  
  def initialize(options)

    @id = options["id"].to_i
    @full_name = options["full_name"]
    @chosen_animal = options["chosen_animal"]
  end

  def save()

    sql = "INSERT INTO owners (full_name, chosen_animal) VALUES ('#{@full_name}','#{@chosen_animal}') RETURNING *"
    animal = SqlRunner.run(sql)
    @id = animal.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM owners"
    result = SqlRunner.run(sql)
    
    return result.map{ |owner_hash| Owner.new(owner_hash) }
  end

  def self.find(id)
    sql = "SELECT * FROM owners WHERE id = #{id}"
    owner = SqlRunner.run(sql)
    result = Owner.new(owner.first)

    return result
  end

end