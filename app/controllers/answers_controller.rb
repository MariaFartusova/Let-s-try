class Questions: :AnswersController < ApplicationController
  before_action :check_user_signed_in

  def create
    @answer = current_user.answers.build(answer_params)

    if @answer.save
      flash[:success] = 'answer created!'
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @answer = current_user.answers.find_by(id: params[:id])
    if @answer.present?
      @answer.destroy
    end
      redirect_to root_url
  end

  private

  def answer_params
    params.require(:answer).permit(:content, :question_id)
  end

  def correct_user
    @answer = current_user.answers.find_by(id: params[:id])
    redirect_to root_url if @answer.nil?
  end
end
