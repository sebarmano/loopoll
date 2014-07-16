class API::V1::QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :destroy, :update]
  respond_to :json
  skip_before_action :require_login 
  
  def index
    @questions = Question.all
  end

  def create
    @question = current_user.question.build(question_params)
    if @question.save
      render "show", :status => :created
    else
      render "create", :status => :bad_request
    end
  end

  def update
    if @question.update(question_params)
      render "show"
    else
      render "create", :status => :bad_request
    end
  end

  def show
  end
  
  def destroy
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:content, :duedate, { answers_attributes: [:id, :content] })
  end
end
