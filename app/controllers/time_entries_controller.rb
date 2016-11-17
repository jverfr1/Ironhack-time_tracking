class TimeEntriesController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
    @entries = @project.time_entries.where("data > ?", 1.month.ago.end_of_month)
  end
  def new
    @project = Project.find(params[:project_id])
    @entry = @project.time_entries.new
  end
  def create
    @project = Project.find(params[:project_id])
    @entry   = @project.time_entries.create(
      hours: params[:time_entry][:hours],
      minutes: params[:time_entry][:minutes],
      data: params[:time_entry][:data])

    if @entry
      redirect_to "/projects/#{@project.id}/time_entries"
    else
      render 'new'
    end
  end
  def edit
    @project = Project.find(params[:project_id])
    @entry = @project.time_entries.find(params[:id])
  end
  def update
    @entry= Project.find(params[:project_id]).time_entries.find(params[:id])
    if @entry.update(entry_params)
      redirect_to action: :index, project_id: Project.find(params[:project_id]).id
    else
      render 'edit'
    end
  end
  private
  def entry_params
    params.require(:time_entry).permit(:hours, :minutes, :data)
  end
end
