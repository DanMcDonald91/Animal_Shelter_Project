require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative('../models/owner')

get '/owners' do
  @owners = Owner.all()
  erb (:"owners/index")
end

get '/owners/new' do
  @owner = Owner.all
  erb(:"owners/new")
end

post '/owners' do
  @owner = Owner.new(params)
  @owner.save
  redirect to 'owners'
end



#request edit owner form (edit)
get '/owners/:id/edit' do
  @owner = Owner.find(params[:id])
  erb(:edit)
end