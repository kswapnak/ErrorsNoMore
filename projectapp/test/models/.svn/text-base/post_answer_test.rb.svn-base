require 'test_helper'

class PostAnswerTest < ActiveSupport::TestCase
  setup do
     @post_answer = PostAnswer.new(:answer => 'What is Integration testing', :post_question_id => post_questions(:one).id, :user_display_name => 'cougar')

   end

   test "should create new  post answer" do
      assert @post_answer.valid?
      assert @post_answer.save   
   end

   test "should not create new  post question with empty question " do
      @post_answer.answer = ""
      assert !@post_answer.valid?
      assert @post_answer.errors.full_messages_for(:answer).include? "Answer can't be blank"
   end

   test "should not create new  post question with empty post question id " do
      @post_answer.post_question_id = ""
      assert !@post_answer.valid?,"No post question id given"
      assert @post_answer.errors.full_messages_for(:post_question_id).include? "Post question can't be blank"
   end  
   
  test "does not require a user display name to create answer" do
      @post_answer.user_display_name = ""
      assert @post_answer.valid?,"User display name not required to create post answer"
  end

end
