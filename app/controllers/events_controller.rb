class EventsController < ApplicationController
  before_action :authenticate, except: [:show]

  # 一覧 index

  # 詳細 show
  def show
    @event = Event.find(params[:id])
  end

  # 新規フォーム new
  def new
    @event = current_user.created_events.build
  end

  # 編集フォーム edit
  def edit
    @event = current_user.created_events.find(params[:id])
  end

  # 新規レコード作成 create
  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      redirect_to @event, notice: '作成しました'
    else
      render :new
    end
  end

  # 更新 update
  def update
    @event = current_user.created_events.find(params[:id])
    if @event.update(event_params)
      redirect_to @event, notice: "更新しました。"
    else
      render :edit
    end
  end

  # 削除 destroy
  def destroy
    @event = current_user.created_events.find(params[:id])
    @event.destroy
    redirect_to :root, notice: "削除しました。"
  end

  private
  def event_params
    attrs = [
      :name, :place, :content, :start_time, :end_time]
    params.require(:event).permit(attrs)
  end
end
