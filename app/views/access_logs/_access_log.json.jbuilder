json.extract! access_log, :id, :logged, :card_id, :door, :action, :detail, :created_at, :updated_at
json.url access_log_url(access_log, format: :json)
