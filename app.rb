require "sinatra"
require "sinatra/reloader"
require "active_record"

require_relative "db/connection.rb"

require_relative "models/pokemon.rb"

get "/pokemon" do
  @pokemons = Pokemon.all
  erb(:"pokemon/index")
end

get "/pokemon/new" do
  erb(:"pokemon/new")
end

get "/pokemon/:id" do
  @pokemon = Pokemon.find(params[:id])
  erb(:"pokemon/show")
end
