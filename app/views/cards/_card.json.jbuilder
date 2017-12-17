json.extract! card, :id, :user, :nick, :after_hours, :expires, :valid_from, :disabled, :magic, :created_at, :updated_at
json.url card_url(card, format: :json)
