json.array!(@timers) do |timer|
  json.extract! timer, :id
  json.url timer_url(timer, format: :json)
end
