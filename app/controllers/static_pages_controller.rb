class StaticPagesController < ApplicationController
  include SessionsHelper

  def home
	@questions = Question.all.paginate(page: params[:page])
	@question = current_user.questions.build
  end
end	

