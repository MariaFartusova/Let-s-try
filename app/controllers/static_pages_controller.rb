class StaticPagesController < ApplicationController
  before_action :signed_in_user
  def home
	@questions = Question.all.paginate(page: params[:page])
	@question = current_user.questions.build
  end
end	
