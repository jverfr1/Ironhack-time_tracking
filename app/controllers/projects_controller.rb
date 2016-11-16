class ProjectsController < ApplicationController
  def index
    @projects = Project.order("created_at DESC").limit(10)
  end

  def show
    @project = Project.find_by(id: params[:id])
    unless @project
      render "no_projects_found"
    end
  end
  def new
    @project = Project.new
  end

  def create
    @projects = Project.new(
      name: params[:project][:name],
      description: params[:project][:description])
    @projects.save
    redirect_to '/projects/#{@projects.id}'
  end
end
