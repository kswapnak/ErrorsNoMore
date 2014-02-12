json.array!(@post_questions) do |post_question|
  json.extract! post_question, :question, :user_id
  json.url post_question_url(post_question, format: :json)
end
