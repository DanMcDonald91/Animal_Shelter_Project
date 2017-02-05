require_relative("../db/sql_runner")

class Animal

  attr_accessor :id, :animal_name, :species, :breed, :admission_date, :adoption_status

  def initialize(options)
    @id = options["id"].to_i
  @species = options["species"]
  @breed = options["breed"]
  @admission_date = options["admission_date"]
  @adoption_status= options["adoption_status"] 
  end

end