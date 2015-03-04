json.array!(@game_rounds) do |game_round|
  json.extract! game_round, :id
  json.url game_round_url(game_round, format: :json)
end
