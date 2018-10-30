class GameSerializer < ActiveModel::Serializer
  attributes :game_id, :scores

  has_many :plays
  belongs_to :player_1
  belongs_to :player_2

  def game_id
    object.id
  end

  def scores
    require "pry"; binding.pry
    [player_1, player_2]
  end

  def player_1
    {user_id: object.player_1_id}
  end

  def player_2
    {user_id: object.player_2_id}
  end
end
