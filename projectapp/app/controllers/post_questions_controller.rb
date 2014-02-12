class PostQuestionsController < ApplicationController
  before_action :set_post_question, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :only => [:create, :update, :new, :edit, :destroy]
 

  # GET /post_questions
  # GET /post_questions.json
  def index
    if params[:search]
      search = params[:search]
      @post_questions = PostQuestion.where("question like ? OR body like ?", "%#{search}%", "%#{search}%")

      PostQuestion.all.each do |question|
        if (! @post_questions.find_by_id(question.id))
          answers = question.post_answers.where("answer like ?", "%#{search}%")
          if answers.count > 0
            @post_questions << question
          end
        end
      end
    else 
      @post_questions = PostQuestion.all
    end
    if !current_user.nil? 
      profile = Profile.find_by_user_id(current_user.id)
      profile = Profile.create(:user_id => current_user.id, :reputation_points => 0) if profile.nil?
    end
  end

  # GET /post_questions/1
  # GET /post_questions/1.json
  def show
    @post_question
    @post_answer = PostAnswer.new
    if (params[:answer_id])
      answer = @post_question.post_answers.find_by_id(params[:answer_id])
      answer.number_of_votes+= params[:vote].to_i unless (answer.number_of_votes == 0 && params[:vote].to_i == -1)
      answer.save
      profile = Profile.find_by_user_id(answer.user_id)
      profile.update(:reputation_points => answer.number_of_votes * 50)
    end
    @post_answers = @post_question.post_answers
    @post_question_id = @post_question.id
  end

  # GET /post_questions/new
  def new
    @post_question = PostQuestion.new
  end

  # GET /post_questions/1/edit
  def edit
  end

  # POST /post_questions
  # POST /post_questions.json
  def create
    @post_question = PostQuestion.new(post_question_params)
    @post_question.user_id = current_user.id.to_s
    respond_to do |format|
      if @post_question.save
        format.html { redirect_to show_post_question_path(@post_question, @post_question.question), notice: 'Post question was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post_question }
      else
        format.html { render action: 'new' }
        format.json { render json: @post_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /post_questions/1
  # PATCH/PUT /post_questions/1.json
  def update
    respond_to do |format|
      if @post_question.update(post_question_params)
        format.html { redirect_to show_post_question_path(@post_question, @post_question.question), notice: 'Post question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /post_questions/1
  # DELETE /post_questions/1.json
  def destroy
    post_answers = @post_question.post_answers
    post_answers.each {|post_answer| post_answer.destroy}
    @post_question.destroy
    respond_to do |format|
      format.html { redirect_to post_questions_url }
      format.json { head :no_content }
    end
  end
  
  def about
  end

  def feedback
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_question
      @post_question = PostQuestion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_question_params
      params.require(:post_question).permit(:question, :user_id, :body)
    end
end
