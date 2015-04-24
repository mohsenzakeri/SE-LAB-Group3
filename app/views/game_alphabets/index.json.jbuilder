json.array!(@game_alphabets) do |game_alphabet|
  json.extract! game_alphabet, :id, :game_id, :round_number, :alphabet
  json.url game_alphabet_url(game_alphabet, format: :json)
end
