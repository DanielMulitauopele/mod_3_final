require 'rails_helper'

describe 'as a guest user' do
  it 'get request' do
    user_1 = create(:user)
    user_2 = create(:user, name: "Michael")
    game = create(:game, id: 2, player_1_id: user_1.id, player_2_id: user_2.id)
    play_1 = user_1.plays.create(word: "hello", game_id: game.id, score: 5)
    play_2 = user_2.plays.create(word: "hello", game_id: game.id, score: 5)

    get "/api/v1/games/#{game.id}"
    expect(response).to be_successful

    details = JSON.parse(response.body)

    expect(details['game_id']).to eq(game.id)
    expect(details['scores']).to be_an(Array)
    expect(details['scores'].count).to eq(2)
  end

  it "post request" do
    user_1 = create(:user)
    user_2 = create(:user, name: "Michael")
    game = create(:game, id: 2, player_1_id: user_1.id, player_2_id: user_2.id)
    play_1 = user_1.plays.create(word: "hello", game_id: game.id, score: 5)
    play_2 = user_2.plays.create(word: "hello", game_id: game.id, score: 5)
    play_params = {user_id: 1, word: "at"}

    post "/api/v1/games/#{game.id}/plays", params: {play: play_params}
    play = Play.last

    expect(response).to be_successful
    expect(response).to eq("201")
    expect(play.name).to eq(play_params[:word])
  end
end
