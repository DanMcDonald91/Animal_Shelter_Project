require('pry-byebug')
require_relative("../models/animal")


animal1 = Animal.new({ "animal_name" => "Biggy",
 "species" => "Dog", "breed" => "BullDog", "admission_date" => "2017-02-05", "adoption_status" => "Available"})


animal2 = Animal.new({ "animal_name" => "Zeus",
 "species" => "Dog", "breed" => "Husky", "admission_date" => "2017-01-25", "adoption_status" => "Available"})

animal3 = Animal.new({ "animal_name" => "Pablo",
 "species" => "Dog", "breed" => "Cockapoo", "admission_date" => "2017-01-30", "adoption_status" => "Reserved"})

animal4 = Animal.new({ "animal_name" => "Keith",
 "species" => "Crocodile", "breed" => "Giant", "admission_date" => "2014-07-10", "adoption_status" => "Available"})

binding.pry

nil
