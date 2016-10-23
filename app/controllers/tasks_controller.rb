class TasksController < ApplicationController
  before_action :require_user
  before_action :find_task, only: [:show, :edit, :update, :destroy, :complete_toggle]

  def index
    @tasks = Task.all
  end

  def show
    # @task = Task.find(params[:id])
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

    # @task.title = params[:task][:title]
    # @task.description = params[:task][:description]
    # @task.completed_at = params[:task][:completed_at]

    if @task.save
      redirect_to root_path
    else
      redirect_to "/tasks/new"
    end
  end

  def edit
    # @task = Task.find(params[:id])
    @path = "update"
  end

  def complete_toggle #rename to complete_toggle
    # @task = Task.find(params[:id])

    # @task.completed_at == nil ? @task.completed_at = Time.now : @task.completed_at = nil
    #
    # @task.save
    @task.completed?

    redirect_to show_path
  end

  def update
    # @task = Task.find(params[:id])

    # @task.update(title: params[:task][:title], description: params[:task][:description], completed_at: params[:task][:completed_at])
    @task.update(task_params)

    redirect_to root_path
  end

  def destroy
    # @task = Task.find(params[:id])

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
