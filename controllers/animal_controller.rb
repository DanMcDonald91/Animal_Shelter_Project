require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative('../models/animal')
require_relative('../models/adoption')
# Get All The Animals
get '/animals' do
  @animals = Animal.all()
  erb (:"animals/index")
end

# Register Animal For Adoption Form
get '/animals/new' do
  erb(:'animals/new')
end

#Send Form Using post
post '/animals' do
  @animal = Animal.new(params)
  @animal.save
  redirect to '/animals'
end

#Get Animal By ID
get '/animals/:id' do
  @animal = Animal.find(params[:id])
  erb (:'animals/show')
  end


#





# ADOPTIONS
get '/adoptions' do
  @adoptions = Adoption.all()
  erb (:'adoptions/index')
end