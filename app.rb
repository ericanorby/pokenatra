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

get "/pokemon/:id/edit" do
  @pokemon = Pokemon.find(params[:id])
  erb(:"pokemon/edit")
end

put "/pokemon/:id" do
  @pokemon = Pokemon.find(params[:id])
  @pokemon.update(params[:pokemon])
  redirect("/pokemon/#{@pokemon.id}")
end

post "/pokemon" do
  params[:pokemon][:img_url] = "http://img.pokemondb.net/artwork/#{params[:pokemon][:name].downcase}.jpg"
  params[:pokemon][:cp] = rand(800)
  @pokemon = Pokemon.create!(params[:pokemon])
  redirect("/pokemon/#{@pokemon.id}")
end

get "/pokemon/:id" do
  @pokemon = Pokemon.find(params[:id])
  erb(:"pokemon/show")
end

delete "/pokemon/:id" do
  @pokemon = Pokemon.find(params[:id])
  @pokemon.destroy
  redirect("/pokemon")
end
