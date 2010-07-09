class EventsController < ApplicationController
  def index
    @events = Event.find(:all)
  end
  
  def show 
    #@event = Event.find(params[:id])
  end
  
  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(params[:event])
    if @event.save
      redirect_to :action => :index
      flash[:notice] = 'create new record success'
    else 
      render :action => :new
    end

  end
  
  def edit
    #@event = Event.find(params[:id])
  end
  
  def update
    #@event = Event.find(params[:id])
    if @event.update_attributes(params[:event])
      redirect_to :action => :show, :id=> @event
      flash[:notice] = 'update record success'
    else
      render :action => :edit
    end
     
  end
  
  def destroy 
    #@event = Event.find(params[:id])
    @event.destroy
    
    redirect_to :aciton => :index
    flash[:notice] = 'delete record success'
  end
  
  before_filter :find_event, :only => [ :show, :edit, :update, :destory ]
  
  protected
  
  def find_event
    @event = Event.find(params[:id])
  end

end
