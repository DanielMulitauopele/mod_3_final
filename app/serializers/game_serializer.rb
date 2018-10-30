class GameSerializer < ActiveModel::Serializer
  attributes :game_id, :scores

  def game_id
    object.id
  end

  def scores
    [player_1, player_2]
  end

  def player_1
    {user_id: object.player_1_id, score: player_1_score}
  end

  def player_2
    {user_id: object.player_2_id, score: player_2_score}
  end

  def player_1_score
    User.find(object.player_1_id).plays.sum(&:score)
  end

  def player_2_score
    User.find(object.player_2_id).plays.sum(&:score)
  end
end
