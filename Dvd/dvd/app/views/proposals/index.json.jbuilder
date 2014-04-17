json.array!(@proposals) do |proposal|
  json.extract! proposal, :id, :chosen_answer
  json.url proposal_url(proposal, format: :json)
end
