class EventsController < ApplicationController
  before_action :authenticate, except: [:show]

  # event詳細
  def show
    @event = Event.find(params[:id])
  end

  # 新規登録フォーム
  def new
    @event = current_user.created_events.build
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      redirect_to @event, notice: '作成しました'
    else
      render :new
    end
  end

  private
  def event_params
    attrs = [
      :name, :place, :content, :start_time, :end_time]
    params.require(:event).permit(attrs)
  end
end
