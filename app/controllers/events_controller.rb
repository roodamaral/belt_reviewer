class EventsController < ApplicationController
  def index
  	@state_events = Event.all.where(state: current_user.state)
  	@other_events = Event.all.where.not(state: current_user.state)
  end

  def show
    @event = Event.find(params[:id])
    @comments = Comment.all.where(event: @event)
  end

  def create 
  	@event = Event.new(name:params['name'], date:params['date'], location:params['location'], state:params['state'], user:current_user)
  	if @event.save
   		flash[:notice] = ['User successfully created']
		redirect_to '/events'
	else
		flash[:errors] = @event.errors.full_messages
		puts flash[:errors]
		redirect_to '/events'
	end
  end

  def edit
  end


  def update
  end

  def join
    event = Event.find(params[:event_id])
    Attendee.create(event: event, user: current_user)
    redirect_to '/events'
  end

  def unjoin 
    event = Event.find(params[:event_id])
    attendee = Attendee.where(event: event, user: current_user)
    Attendee.destroy(attendee)
    redirect_to '/events'


  end

    
  

  def destroy
  	Event.destroy(params[:event_id])
  	redirect_to '/events'
  end

end

