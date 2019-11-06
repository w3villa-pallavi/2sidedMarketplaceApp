class ProfilesController < ApplicationController
  before_action :authenticate_runner!

  def index
    @profile = Profile.all
    if params[:q].present?
      p params[:q]
      @profile = Profile.all
    end
    @search = Profile.search(params[:q])
  end

  def show
    @profile = Profile.find(params[:id])
  end

  private 

  def authorize
    if current_user != @profile.username
      flash[:alert] = "Cannot access this profile"
      redirect_to root_path
    end
  end

  def profile_params
    params.require(:profile).permit(:username, :age, :gender, :pace, :image)
  end
end
