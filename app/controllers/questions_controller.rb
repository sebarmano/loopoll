class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.order(:duedate)
    @question = Question.new
    @question.answers.build
    @user_questions = current_user.questions.order(created_at: :desc)
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @result = Result.new
    @results = @question.results
    @answers = @question.answers
  end

  # GET /questions/new
  def new
    @question = Question.new
    @question.answers.build
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id
    respond_to do |format|
      if @question.save #TODO add if logged in w twitter. add option to tweet or not.
       # binding.pry
        
        @question.tweet_question(session[:token], session[:secret], @question) if params[:commit] == "Create & tweet!" 
        format.html { redirect_to questions_path, notice: 'Question was successfully created.' }
        format.js
      else
        format.js  { render :new }
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:content, :duedate, { answers_attributes: [:id, :content] })
    end
end
