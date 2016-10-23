class TasksController < ApplicationController
  before_action :require_user
  before_action :find_task, only: [:show, :edit, :update, :destroy, :complete_toggle]

  def index
    @tasks = Task.all
  end

  def show
    @datetime = @task.completed_at

    if @task.completed_at != nil
      @status = "Done at #{@datetime.strftime('%I:%M %P')} on #{@datetime.strftime('%B %e, %Y')}"
    else
      @status = "Still in progress"
    end
  end

  def new
    @task = Task.new
    @path = "create"
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to root_path
    else
      redirect_to "/tasks/new"
    end
  end

  def edit
    @path = "update"
  end

  def complete_toggle
    @task.completed?

    redirect_to show_path
  end

  def update
    @task.update(task_params)

    redirect_to root_path
  end

  def destroy
    @task.destroy

    redirect_to root_path
  end

  private
  #This can be for security purposes (probably more important for user)
  def task_params
    params.require(:task).permit(:title, :description, :completed_at)
  end

  def find_task
    @task = Task.find(params[:id])
  end
end
