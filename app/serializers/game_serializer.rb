class GameSerializer < ActiveModel::Serializer
  attributes :game_id, :scores

  def game_id
    :id
  end

  def scores
    
  end
end
