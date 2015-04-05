class PokemonController < ApplicationController

	def new
	  @pokemon = Pokemon.new	
	end

	def capture
	  @pokemon = Pokemon.find(params[:id])
	  @pokemon.trainer = current_trainer
	  @pokemon.save
	  redirect_to root_path
	end

	def damage
	  @pokemon = Pokemon.find(params[:id])
	  @pokemon.health = @pokemon.health - 10

	  if @pokemon.health <= 0 
	  	@pokemon.destroy
	  	redirect_to @pokemon.trainer
	  else 
	  	@pokemon.save
	  	redirect_to @pokemon.trainer
	  end
	end

	def create
	  @pokemon = Pokemon.new
	  @pokemon.name = params[:pokemon][:name]
	  @pokemon.trainer = current_trainer
	  @pokemon.level = 1
	  @pokemon.health = 100
	  if @pokemon.save
	    redirect_to current_trainer
	  else
	  	flash[:error] = @pokemon.errors.full_messages.to_sentence
	  	redirect_to new_path
	  end
	end
end
