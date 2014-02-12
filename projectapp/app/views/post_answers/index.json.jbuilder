json.array!(@post_answers) do |post_answer|
  json.extract! post_answer, :answer
  json.url post_answer_url(post_answer, format: :json)
end
