class GamesController < ApplicationController
	def new
		@game = Game.new
	end

	def edit
		@game = Game.find(params[:id])
	end

	def update
		@game = Game.find(params[:id])

		if @game.update(game_params)
			redirect_to @game
		else
			render 'edit'
		end
	end

	def create
		@game = Game.new(params.require(:game).permit(:title, :description, :genre))

		if @game.save
			redirect_to @game
		else
			render 'new'
		end
	end

	def show
		@game = Game.find(params[:id])
	end

	def index
		@games = Game.all
	end

	def destroy
		@game = Game.find(params[:id])
		@game.destroy

		redirect_to games_path
	end

	private
		def game_params
			params.require(:game).permit(:title, :description, :genre)
		end
end
