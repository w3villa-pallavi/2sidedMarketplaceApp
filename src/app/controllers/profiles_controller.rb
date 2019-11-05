class ProfilesController < ApplicationController
  before_action :authenticate_runner!

  # def show
  #   @profile = Runner.find(params[:id])
  # end

  # def new
  #   @runner = Runner.new
  #   @runner.build_profile
  #   #Is this okay above? Needed. What do? 
  # end

  # def create
  #   @runner = Runner.new(runner_params)
  #   @runner.image.attach(runner_params[:image])
  #   @runner.save 
  #   respond_to do |format|
  #     if @runner.save
  #       format.html { redirect_to runners_path, notice: 'Profile was successfully created.' }
  #       format.json { render :index, status: :created, location: @runner }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @runner.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # def edit
  #   @runner = Runner.find(params[:id])
  # end

  # def update
  #     @runner = Runner.find(params[:id])
  #     @runner.update(runner_params)
  #     @runner.image.attach(runner_params[:image]) if runner_params[:image] 
  #     @runner.save
  #     respond_to do |format|
  #       if @runner.update(runner_params)
  #         format.html { redirect_to @runner, notice: 'Profile was successfully updated.' }
  #         format.json { render :show, status: :ok, location: @runner }
  #       else
  #         format.html { render :edit }
  #         format.json { render json: @runner.errors, status: :unprocessable_entity }
  #       end
  #     end
  # end

  # def delete
  #   @runner = Runner.find(params[:id])
  # end
  
  # def destroy
  #   @runner.destroy
  #   respond_to do |format|
  #     format.html { redirect_to runners_url, notice: 'Profile was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  def index
    @search = Profile.search(params[:q])
    @profile = @search.result
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
