json.array!(@game_judges) do |game_judge|
  json.extract! game_judge, :id, :game_round_id, :firstname, :lastname, :city, :country, :fruit, :car, :color, :job, :food, :thing, :animal, :flower
  json.url game_judge_url(game_judge, format: :json)
end
