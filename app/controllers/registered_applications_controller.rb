class RegisteredApplicationsController < ApplicationController

  def new
    @registered_app = RegisteredApplication.new
    @user = User
  end


  def create
    @user = current_user
    @app = current_user.registered_applications.build(application_params)

    if @app.save
      flash[:notice] = "#{@app.name} was updated successfully."
      redirect_to registered_applications_path
    else
      flash.now[:alert] = "There was an error updating the app."
      render :new
    end
  end


  def destroy
    @app = RegisteredApplication.find(params[:id])

    if @app.destroy
      flash[:notice] = "#{@app.name} was unregistered successfully."
      redirect_to registered_applications_path
    else
      flash.now[:notice] = "There was an error unregistering the app."
      render :new
    end
  end

  def index
    @event = Event.all
    @registered_application = RegisteredApplication.all
    @events_group = @event.group_by(&:name)
  end

  def show
    @registered_application = RegisteredApplication.all
    @user = User.find(current_user)
  end


  private

    def application_params
      params.require(:registered_application).permit(:name, :url, :user_id)
    end

    def user_log_in?
      redirect_to user_session_path unless user_signed_in?
    end
   end
