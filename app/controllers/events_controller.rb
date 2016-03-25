class EventsController < ApplicationController
  before_action :find_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all.order("created_at DESC")
  end

  def new
    @evevt = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      flash[:notice] = "成功建立"
    	redirect_to :action => :index
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @event.update
      flash[:notice] = "成功修改"
      edirect_to :action => :index
    else
      render 'edit'
    end
  end

  def destroy
    @event.destroy
    flash[:notice] = "成功刪除"
    redirect_to :action => :index
  end

    private

    def find_event
  		@event = Event.find(params[:id])
  	end

  	def event_params
  		params.require(:event).permit(:topic, :article)
    end

end
