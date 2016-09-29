class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])

    if @task[:completion] == true
      @status = "Done at #{@task[:completed_at]}"
    else
      @status = "Still in progress"
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new

    @task.title = params[:task][:title]
    @task.description = params[:task][:description]
    @task.completed_at = params[:task][:completed_at]

    @task.save

    redirect_to root_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    @task.title = params[:post][:title]
    @task.description = params[:post][:description]
    @task.completed_at = params[:post][:completed_at]

    @task.save
  end

  def destroy
    @task = Task.find(params[:id])

    @task.destroy

    redirect_to root_path
  end
end
