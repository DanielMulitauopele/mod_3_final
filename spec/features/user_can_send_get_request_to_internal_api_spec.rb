require 'rails_helper'

describe 'as a guest user' do
  it 'should return game and score data in specific format' do
    get '/api/v1/games/1'

    expect(response).to be_successful

    details = JSON.parse(response.body)

    expect(details[:game_id]).to eq(1)
    expect(details[:scores]).to be_an(Array)
    expect(details[:scores].count).to eq(2)
  end
end
