class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(params.require(:schedule).permit(:title, :start_date, :end_date, :all, :note))

    if @schedule.save
      flash[:notice_green] = "スケジュールを登録しました"
      redirect_to :schedules
    else
      flash.now[:notice_red] = "登録できませんでした"
      render "new"
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
  end
  

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(params.require(:schedule).permit(:title, :start_date, :end_date, :all, :note))
      flash[:notice_green] = "スケジュールを更新しました"
      redirect_to :schedules
    else
      flash.now[:notice_red] = "更新できませんでした"
      render "edit"
    end

  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    flash[:notice_red] = "スケジュールを削除しました"
    redirect_to :schedules
  end

end
