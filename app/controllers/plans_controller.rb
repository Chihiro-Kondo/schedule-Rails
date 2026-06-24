class PlansController < ApplicationController
  def index
    @plans = Plan.all
  end

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(params.require(:plan).permit(:title, :start_day, :finish_day, :all_day, :memo))
    if @plan.save
      flash[:notice] = "スケジュールを新規追加しました"
      redirect_to :plans
    else
      render "new", status: :unprocessable_entity
    end
  end

  def show
    @plan = Plan.find(params[:id])
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    @plan = Plan.find(params[:id])
    if @plan.update(params.require(:plan).permit(:title, :start_day, :finish_day, :all_day, :memo))
    flash[:notice] = "「#{@plan.id}」のスケジュールを変更しました"
    redirect_to :plans
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    @plan = Plan.find(params[:id])
    @plan.destroy
    flash[:notice] = "「#{@plan.id}」のスケジュールを削除しました"
    redirect_to :plans
  end
end
