class RegisteredApplicationsController < ApplicationController

  def new
    @registered_application = RegisteredApplication.new
  end


  def create
    @registered_application = RegisteredApplication.new

      respond_to do |format|
        if @registered_application.save
          format.html { redirect_to @registered_application, notice: 'Registered application was successfully created.' }
          format.json { render :show, status: :created, location: @registered_application }
        else
          format.html { render :new }
          format.json { render json: @registered_application.errors, status: :unprocessable_entity }
        end
      end
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
    @registered_application = current_user.registered_applications

  end

  def show
    @registered_application = current_user.registered_applications
    @user = User.find(current_user)
  end

  def update
    @registered_application = RegisteredApplication.find(params[:id])
    respond_to do |format|
      if @registered_application.update(registered_application_params)
        format.html { redirect_to @registered_application, notice: 'Registered application was successfully updated.' }
        format.json { render :show, status: :ok, location: @registered_application }
      else
        format.html { render :edit }
        format.json { render json: @registered_application.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def application_params
      params.require(:registered_application).permit(:name, :url, :user_id)
    end

    def user_log_in?
      redirect_to user_session_path unless user_signed_in?
    end
   end
