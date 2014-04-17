json.array!(@answers) do |answer|
  json.extract! answer, :id, :good_answer, :bad_answer, :bad_answer_2
  json.url answer_url(answer, format: :json)
end
