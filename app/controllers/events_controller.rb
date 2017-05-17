class EventsController < ApplicationController
  def create
    @registered_app = RegisteredApplication.find(params[:registered_application_id])
    @event = @registered_app.event.new(event_params)

    if @event.save
      flash[:notice] = "Event saved successfully."
      redirect_to @registered_app
    else
      flash[:alert] = "There was an error saving the event."
      redirect_to @registered_app
  end

  private

  def event_params
    params.require(:event).permit(:registered_application_id, :id)
  end

end
end
