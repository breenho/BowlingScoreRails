json.extract! game, :id, :name, :overal_score, :user_id, :created_at, :updated_at
json.url game_url(game, format: :json)
