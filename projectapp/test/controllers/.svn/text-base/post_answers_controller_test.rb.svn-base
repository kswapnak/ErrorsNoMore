require 'test_helper'

class PostAnswersControllerTest < ActionController::TestCase
  setup do
    @post_answer = post_answers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:post_answers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create post_answer" do
    assert_difference('PostAnswer.count') do
      post :create, post_answer: { answer: @post_answer.answer, post_question_id: @post_answer.post_question_id, user_display_name: 'Sooner' }
    end

    assert_redirected_to post_question_path(assigns(:post_answer).post_question)
  end
  
  test "should not create post_answer" do
    sign_in users(:three)
     assert_difference('PostAnswer.count',0) do
       post :create, post_answer: { answer: "", post_question_id: @post_answer.post_question_id }
     end
     assert_response :redirect
   end

  test "should show post_answer" do
    get :show, id: @post_answer
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:three)
    get :edit, id: @post_answer
    assert_response :success
  end

  test "should not get edit" do
    get :edit, id: @post_answer
    assert_redirected_to new_user_session_path
  end

  test "should update post_answer with minimum points" do
    sign_in users(:three)
    patch :update, id: @post_answer, post_answer: { answer: @post_answer.answer }
    assert_redirected_to post_question_path(assigns(:post_answer).post_question)
  end

  test "should not update post_answer without minimum reputation points" do
    sign_in users(:one)
    patch :update, id: @post_answer, post_answer: { answer: @post_answer.answer }
    assert_response :success
  end
  
  test "should not update post_answer" do
    sign_in users(:three)
    patch :update, id: @post_answer, post_answer: { answer: ""  }
    assert_response :success
  end

  test "should destroy post_answer" do
    sign_in users(:three)
    assert_difference('PostAnswer.count', -1) do
      delete :destroy, id: @post_answer
    end

    assert_redirected_to post_answers_path
  end

  test "should not destroy post_answer usigned user" do
    assert_difference('PostAnswer.count', 0) do
      delete :destroy, id: @post_answer
    end

    assert_redirected_to new_user_session_path
  end
end
