class GamesController < ApplicationController
	
	def index
		@games = Game.all
	end

	def show
		@game = Game.find(params[:id])
	end

	def new
		@game = Game.new
	end

	def create
		@games = Game.all
		@game = Game.create(game_params)
	end

	def edit
		@game = Game.find(params[:id])
	end

	def update
		@games = Game.all
		@game = Game.find(params[:id])

		@game.update_attributes(game_params)
	end

	def delete
		@game = Game.find(params[:game_id])
	end

	def destroy
		@games = Game.all
		@game = Game.find(params[:id])
		@game.destroy
	end

	private
		def game_params
			params.require(:game).permit(:title, :description, :genre)
		end
end
