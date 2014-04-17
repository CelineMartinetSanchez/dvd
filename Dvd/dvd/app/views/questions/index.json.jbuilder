json.array!(@questions) do |question|
  json.extract! question, :id, :query, :explanation
  json.url question_url(question, format: :json)
end
