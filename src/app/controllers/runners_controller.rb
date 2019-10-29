class RunnersController < ApplicationController
    before_action :authenticate_runner!
  def index
    @runners = Runner.sorted 
  end

  def show
    @runner = Runner.find(params[:id])
  end

  def new
    @runner = Runner.new
  end

  def create
    @runner = Runner.new(runner_params)
    @runner.image.attach(runner_params[:image])
    @runner.save 
    if @runner.save
      redirect_to(runners_path)
    else
      render("new")
    end
  end

  def edit
    @runner = Runner.find(params[:id])
  end

  def update
      @runner = Runner.find(params[:id])
      @runner.update(runner_params)
      @runner.image.attach(runner_params[:image]) if runner_params[:image] 
      @runner.save
    if @runner.save
      flash[:notice] = "You've updated your profile"
      redirect_to(runner_path(@runner))
    else
      flash[:notice] = "Edit failed. Try again"
      render("edit")
    end
  end

  def delete
    @runner = Runner.find(params[:id])
  end
  
  def destroy
    @runner.destroy
    flash[:notice] = "Your account is deleted!"
    redirect_to(runners_path) 
  end

  private 

  def runner_params
    params.require(:runner).permit(:username, :first_name, :last_name, :email, :bio, :image)
  end
end
