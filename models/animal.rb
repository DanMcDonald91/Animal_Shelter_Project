  require_relative("../db/sql_runner")


    class Animal

      attr_accessor :id, :animal_name, :species, :breed, :admission_date, :adoption_status

      def initialize(options)
        @id = options["id"].to_i
      @animal_name = options["animal_name"]  
      @species = options["species"]
      @breed = options["breed"]
      @admission_date = options["admission_date"]
      @adoption_status= options["adoption_status"] 
      end

      def save()
        sql = "INSERT INTO animals (animal_name, species, breed, admission_date, adoption_status) VALUES ('#{@animal_name}','#{@species}','#{@breed}','#{@admission_date}','#{adoption_status}') RETURNING *"
        animal = SqlRunner.run(sql)
        @id = animal.first()['id'].to_i
      end

   def self.all()
     sql = "SELECT * FROM animals"
     result = SqlRunner.run(sql)
     
     return result.map{ |animal_hash| Animal.new(animal_hash) }
   end

   def self.find(id)
    sql = "SELECT * FROM animals WHERE adoption_status = #{id}"
    animal = SqlRunner.run(sql)
    result = Animal.new(animal.first)

  return result
  end


    end
 
