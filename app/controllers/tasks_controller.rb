class TasksController < ApplicationController
  before_action :require_user
  before_action :find_task, only: [:show, :edit, :update, :destroy, :complete_toggle]

  def index
    @tasks = Task.where(user_id: session[:user_id])
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
    @path = create_path
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      flash[:notice] = "Task successfully created"
      redirect_to root_path
    else
      flash[:notice] = @task.errors.full_messages
      redirect_to "/tasks/new"
    end
  end

  def edit
    find_task
    @path = update_path
  end

  def complete_toggle
    @task.completed?

    redirect_to show_path
  end

  def update
    find_task
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
    params.require(:task).permit(:title, :description, :completed_at, :user_id)
  end

  def find_task
    if Task.find(params[:id]).user_id == session[:user_id]
      @task = Task.find(params[:id])
    else
      redirect_to root_path
    end
  end
end
