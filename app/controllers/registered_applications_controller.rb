class RegisteredApplicationsController < ApplicationController

  def new
    @registered_application = RegisteredApplication.new
  end


  def create
    @registered_application = RegisteredApplication.new(:registered_application_id)

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

def edit
  @registered_application = RegisteredApplication.find(params[:registered_application_id])
  end

  def destroy
    @registered_application = RegisteredApplication.find(params[:registered_application_id])

    if @registered_application.destroy
      flash[:notice] = "#{@registered_application.name} was unregistered successfully."
      redirect_to registered_application_path
    else
      flash.now[:notice] = "There was an error unregistering the app."
      render :new
    end
  end

  def index
    @registered_applications = RegisteredApplication.all

  end

  def show
    @registered_application = RegisteredApplication.find(current_user)
    @event = Event.find(@registered_application)
    @events = @registered_application.events.group_by(&:name)
  end

  def update
    @registered_application = RegisteredApplication.find(application_params)
      @registered_application.name = params[:registered_application][:name]
      @registered_application.url = params[:registered_application][:url]

      respond_to do |format|
      if @registered_application.update(application_params)
        format.html { redirect_to @registered_application, notice: 'Registered application was successfully updated.' }
        format.json { render :show, status: :ok, location: @registered_application }
      else
        format.html { render :edit }
        format.json { render json: @registered_application.errors, status: :unprocessable_entity }
      end
    end
  end


  private

  def event_params
    params.permit(:name)
  end

    def application_params
      params.permit(:name, :url)
    end

    def user_log_in?
      redirect_to user_session_path unless user_signed_in?
    end
   end
