class ProfilesController < ApplicationController
  def index
    @search = Profile.search(params[:q])
    @profile = @search.result

  end
  def show
  end

  private 

  def profile_params
    params.require(:profile).permit(:username, :age, :gender, :pace)
  end
end
