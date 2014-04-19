json.array!(@votes) do |vote|
  json.extract! vote, :id, :user, :checkboxes, :story, :story_approved
  json.url vote_url(vote, format: :json)
end
