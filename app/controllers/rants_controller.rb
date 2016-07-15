class RantsController < ApplicationController
  def index
  end

  def new
  	@new_rant = Rant.new
  end

  def create
  	@user = current_user
  	@new_rant = @user.rant
  end

  def show
  end
end
