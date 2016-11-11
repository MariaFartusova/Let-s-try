class StaticPagesController < ApplicationController
  def home
  	if signed_in?
  		@questions = current_user.questions.paginate(page: params[:page])
  		@question = current_user.questions.build
    end
  end

  def help
  end

  def about
  end
end
