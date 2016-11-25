class StaticPagesController < ApplicationController
  before_action :check_user_signed_in

  def home
	@questions = Question.all.paginate(page: params[:page])
	@question = current_user.questions.build
  end
end	

