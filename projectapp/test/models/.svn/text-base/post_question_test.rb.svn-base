require 'test_helper'

class PostQuestionTest < ActiveSupport::TestCase
  
  setup do
    @post_question = PostQuestion.new(
      :question => 'I am new to SublimeText, use SublimeText3. Along with the daily usage, 
        I am developing some plug-in, so I would like to understand the manner deeply.',
      :user_id => 1, 
      :body => 'I want to know more about Integration testing'
    )
  end
  
  test "should create new post question" do
     assert @post_question.valid?
     assert @post_question.save   
  end
  
  test "question is required" do
     @post_question.question = ""
     assert !@post_question.valid?
     assert @post_question.errors.full_messages_for(:question).include? "Question can't be blank"
  end
  
  test "user id is required " do
     @post_question.user_id = ""
     assert !@post_question.valid?,"No user id given"
     assert @post_question.errors.full_messages_for(:user_id).include? "User can't be blank"
  end  

  test "body is required" do
     @post_question.body = ""
     assert !@post_question.valid?, "Body can't be empty"
     assert @post_question.errors.full_messages_for(:body).include? "Body can't be blank"
  end

  test "minimum characters for question" do
    @post_question.question = "what is this?"
    assert !@post_question.valid?
    assert @post_question.errors.full_messages_for(:question).include? "Question is too short (minimum is 15 characters)"
  end
end
