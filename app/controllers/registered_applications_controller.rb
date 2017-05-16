class RegisteredApplicationsController < ApplicationController

  def new
    @registered_app = RegisteredApplication.new

  end


  def create
    @app = RegisteredApplication.new(application_params)
    @app.user = current_user

    if @app.save
      flash[:notice] = "#{@app.name} was updated successfully."
      redirect_to created_registered_applications
    else
      flash.now[:alert] = "There was an error updating the app."
      render :edit
    end
  end


  def destroy
    @app = RegisteredApplication.find(params[:user_id])

    if @app.destroy
      flash[:notice] = "#{@app.name} was unregistered successfully."
      redirect_to registered_applications_path
    else
      flash.now[:notice] = "There was an error unregistering the app."
      render :edit
    end
  end

  def show
    @app = RegisteredApplication.find(params[:user_id])
    @user = User.find(current_user.id)

  end

  def index
    @app = RegisteredApplication.all
    @user = User.find(current_user.id)
  end


  private

    def application_params
      params.require(:registered_application).permit(:name, :url)
    end

    def user_log_in?
      redirect_to user_session_path unless user_signed_in?
    end
   end
