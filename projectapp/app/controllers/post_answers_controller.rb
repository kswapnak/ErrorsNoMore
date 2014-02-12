class PostAnswersController < ApplicationController
  before_action :set_post_answer, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :only => [ :update, :edit, :destroy]

  # GET /post_answers
  # GET /post_answers.json
  def index
    @post_answers = PostAnswer.all
  end

  # GET /post_answers/1
  # GET /post_answers/1.json
  def show
  end

  # GET /post_answers/new
  def new
    @post_answer = PostAnswer.new
  end

  # GET /post_answers/1/edit
  def edit
  end

  # POST /post_answers
  # POST /post_answers.json
  def create
    @post_answer = PostAnswer.new(post_answer_params)
    if current_user.nil?
      @post_answer.user_id = 0
    else
      @post_answer.user_id = current_user.id.to_s
    end
    respond_to do |format|
      if @post_answer.save
        format.html { redirect_to @post_answer.post_question, notice: 'Post answer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post_answer }
      else
        format.html { redirect_to PostQuestion.where(:id => @post_answer.post_question_id).first}
        format.json { render json: @post_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /post_answers/1
  # PATCH/PUT /post_answers/1.json
  def update
    respond_to do |format|
      if Profile.find_by_user_id(current_user.id).reputation_points > 0 && @post_answer.update(post_answer_params)
        format.html { redirect_to @post_answer.post_question, notice: 'Post answer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /post_answers/1
  # DELETE /post_answers/1.json
  def destroy
    @post_answer.destroy
    respond_to do |format|
      format.html { redirect_to post_answers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_answer
      @post_answer = PostAnswer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_answer_params
      params.require(:post_answer).permit(:answer, :post_question_id, :user_display_name)
    end
end
