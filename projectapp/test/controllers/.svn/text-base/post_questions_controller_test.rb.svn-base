require 'test_helper'

class PostQuestionsControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  fixtures :users
  setup do
    @post_question = post_questions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:post_questions)
  end

  test "should get profile for signed in user" do
    sign_in users(:three)
    get :index
    assert_response :success
    assert_not_nil assigns(:post_questions)
    assert_not_nil Profile.find_by_user_id(users(:three).id)
  end

  test "should get new" do
    sign_in users(:three)
    get :new
    assert_response :success
  end

  test "should not get new" do
    get :new
    assert_redirected_to new_user_session_path
  end
  
  test "signed-in user creates a post question " do
    sign_in users(:three)
    assert_difference('PostQuestion.count') do
      post :create, post_question: { question: "My name is Swapna and this is a test question", user_id: users(:three).id, body: "sample test1 string"}
    end
    assert_redirected_to show_post_question_path(assigns(:post_question).id, assigns(:post_question).question)
  end
  
  test "signed-in user should not create a post question with empty question " do
    sign_in users(:three)
    assert_difference('PostQuestion.count', 0) do
      post :create, post_question: { question: "", user_id: users(:three).id, body: "sample test2 string"}
    end
    assert_response :success
  end
    
  test "should not create post_question when registered user is not signed in " do
    assert_difference('PostQuestion.count', 0) do
      post :create, post_question: { question: "", user_id: 1 }
    end
    assert_redirected_to new_user_session_path (assigns(:post_question))
  end
      
  test "should not create post_question when user is not signed up " do
    assert_difference('PostQuestion.count', 0) do
      post :create, post_question: { question: "sample question sample question", user_id: 1 }
    end
    assert_redirected_to new_user_session_path (assigns(:post_question))
  end

  test "should show post_question" do
    get :show, id: @post_question
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:three)
    get :edit, id: @post_question
    assert_response :success
  end

  test "should not get edit for unsigned users" do
    get :edit, id: @post_question
    assert_redirected_to new_user_session_path
  end

  test "signed-in user update post_question" do
    sign_in users(:three)
    patch :update, id: @post_question, post_question: { question: @post_question.question, user_id: users(:three).id, body: "sample test1 string" }
    assert_redirected_to show_post_question_path(assigns(:post_question).id, assigns(:post_question).question)
  end

  test "signed-in user should not update a post question with empty question" do
    sign_in users(:three)
    patch :update, id: @post_question, post_question: { question: "", user_id: users(:three).id, body: "sample test2 string" }
    assert_response :success
  end

  test "signed-in user should destroy post_question" do
    sign_in users(:three)
    assert_difference('PostQuestion.count', -1) do
      delete :destroy, id: @post_question
    end

    assert_redirected_to post_questions_path
  end

  test "unsigned user should not destroy post_question" do
    assert_difference('PostQuestion.count', 0) do
      delete :destroy, id: @post_question
    end
    assert_redirected_to new_user_session_path
  end

  test "sign up and post question" do
    user = User.create(:email => 'jlock@apple.com', :encrypted_password => 'MyString')
    sign_in users(:one)

    assert_response(:success) 
  end

  test "vote up for a post answer" do
    sign_in users(:three)
    answer = post_answers(:one)
    @post_question.post_answers << answer
    get :show, {:id => @post_question, :vote => 1, :answer_id => answer.id }
    assert_response :success
    assert_equal(1, @post_question.post_answers.first.number_of_votes)
  end

  test "vote down for a post answer" do
    sign_in users(:three)
    answer = post_answers(:two)
    @post_question.post_answers << answer
    get :show, {:id => @post_question, :vote => -1, :answer_id => answer.id }
    assert_response :success
    assert_equal(0, @post_question.post_answers.first.number_of_votes)
  end

  test "search for a keyword in question and answer" do
    get :index, {:search => "Problem"}
    assert_equal post_answers(:one).post_question, assigns(:post_questions).first
  end
end
