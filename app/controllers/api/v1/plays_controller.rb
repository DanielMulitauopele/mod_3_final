class Api::V1::PlaysController < ApplicationController
  def create
    game = Game.find(params[:game_id])
    render json: game.plays.create(play_params)
  end

  private

  def play_params
    params.require(:play).permit(:user_id, :word)
  end
end
