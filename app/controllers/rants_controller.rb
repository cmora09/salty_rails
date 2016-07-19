class RantsController < ApplicationController
  
  before_action :logged_in_user, only: [:create,:destroy]
  before_action :correct_user,   only: :destroy

  def index
  	@main_feed = Rants.all
  	@user = User.find(params[:id])
  	@user_feed = @user.rants
  end

  def new
  	@new_rant = Rant.new
  end

  def edit
  end

  def create
  	@rant = current_user.rants.build(rant_params)
  	if @rant.save
  		flash[:success] = "Your saltyness was posted."
  		redirect_to root_url
  	else
  		flash[:error] = "Something went wrong. Stay Salty."
  		redirect_to root_url
  	end
  	
  end

  def show
  end

  def destroy
  	@rant.destroy
  	flash[:success] = "You've deleted your salty post."
  	redirect_to request.referrer || root_url
  end


  private
  def rant_params
  	params.require(:rant).permit(:rant)
  end
end
