  require_relative("../db/sql_runner")


  class Animal

    attr_accessor :id, :animal_name, :species, :breed, :admission_date, :adoption_status, :animal_picture

    def initialize(options)
      @id = options["id"].to_i
      @animal_name = options["animal_name"]  
      @species = options["species"]
      @breed = options["breed"]
      @admission_date = options["admission_date"]
      @adoption_status = options["adoption_status"]
      @animal_picture = options["animal_picture"] 
    end

    def save()
      sql = "INSERT INTO animals (animal_name, species, breed, admission_date, adoption_status, animal_picture) VALUES ('#{@animal_name}','#{@species}','#{@breed}','#{@admission_date}','#{adoption_status}','#{@animal_picture}') RETURNING *"
      animal = SqlRunner.run(sql)
      @id = animal.first()['id'].to_i
    end

    def self.all()
     sql = "SELECT * FROM animals"
     result = SqlRunner.run(sql)
     
     return result.map{ |options| Animal.new(options) }
    end

   def self.find(id)
    sql = "SELECT * FROM animals WHERE id = #{id}"
    animal = SqlRunner.run(sql)
    result = Animal.new(animal.first)

    return result
   end

   def self.delete(id)
    sql = "DELETE FROM animals WHERE id = #{id};"
    SqlRunner.run(sql)
  end




  end