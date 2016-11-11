class StaticPagesController < ApplicationController
  def home
  	if signed_in?
  		@questions = Question.all.paginate(page: params[:page])
  		@question = current_user.questions.build
    end
  end
end