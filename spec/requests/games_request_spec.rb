require 'rails_helper'

describe 'as a guest user' do
  it 'should return game and score data in specific format' do
    game = create(:game)

    get "/api/v1/games/#{game.id}"
    expect(response).to be_successful
    
    details = JSON.parse(response.body)

    expect(details[:game_id]).to eq(game.id)
    expect(details[:scores]).to be_an(Array)
    expect(details[:scores].count).to eq(2)
  end
end
