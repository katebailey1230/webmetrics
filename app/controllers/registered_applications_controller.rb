class RegisteredApplicationsController < ApplicationController

  def new
    @registered_application = RegisteredApplication.new
  end


  def create
    @registered_application = RegisteredApplication.new
    @registered_application.name = params[:registered_application][:name]
    @registered_application.url = params[:registered_application][:url]
    @registered_application.user = current_user

    if @registered_application.save
      flash[:notice] = "You successfully registered your app."
      redirect_to user_registered_application_path(current_user.id, @registered_application.id)
    else
      flash.now[:alert] = "There was an error registering your app. Please try again."
      render :new
    end
  end

def edit
  @registered_application = RegisteredApplication.find(params[:id])
  end

  def destroy
    @app = RegisteredApplication.find(params[:id])

    if @app.destroy
      flash[:notice] = "#{@app.name} was unregistered successfully."
      redirect_to registered_application_path
    else
      flash.now[:notice] = "There was an error unregistering the app."
      render :new
    end
  end

  def index
    @event = Event.all
    @registered_application = RegisteredApplication.find(params[:id])
    @events = @registered_application.events.sort_by(&:name)

  end

  def show
    @registered_application = RegisteredApplication.find(params[:id])
    @events = @registered_application.events.sort_by(&:name)
  end

  def update
    @registered_application = RegisteredApplication.find(params[:id])
      @registered_application.name = params[:registered_application][:name]
      @registered_application.url = params[:registered_application][:url]

      if @registered_application.save
        flash[:notice] = "Registered app was updated successfully."
        redirect_to user_registered_application_path
      else
        flash.now[:alert] = "There was an error updating the registered app. Please try again."
        render :edit
      end
    end


  private

    def application_params
      params.require(:registered_application).permit(:name, :url, :registered_application_id)
    end

    def user_log_in?
      redirect_to user_session_path unless user_signed_in?
    end
   end
