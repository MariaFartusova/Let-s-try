class QuestionsController < ApplicationController
  before_action :check_user_signed_in

  def index
    @questions = Question.paginate(page: params[:page])
  end
  
  def create
  	@question = current_user.questions.build(question_params)
    if @question.save
      flash[:success] = "Question created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @question = current_user.questions.find_by(id: params[:id])
    if @question.present?
      @question.destroy
    end
      redirect_to root_url
  end

private

  def question_params
    params.require(:question).permit(:content)
  end

  def correct_user
      @question = current_user.questions.find_by(id: params[:id])
      redirect_to root_url if @question.nil?
  end
end