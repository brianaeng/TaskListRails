class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
    @datetime = @task.completed_at

    if @task.completed_at != nil
      @status = "Done at #{@datetime.strftime('%I:%M %P')} on #{@datetime.strftime('%B %e, %Y')}"
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

  def button
    @task = Task.find(params[:id])

    if @task.completed_at == nil
      @task.completed_at = Time.now
    else
      @task.completed_at = nil
    end

    @task.save

    redirect_to show_path
  end

  def update
    @task = Task.find(params[:id])

    @task.update(title: params[:task][:title], description: params[:task][:description], completed_at: params[:task][:completed_at])

    # @task = Task.find(params[:id])
    #
    # @task.title = params[:task][:title]
    # @task.description = params[:task][:description]
    # @task.completed_at = params[:task][:completed_at]
    #
    # @task.save

    redirect_to root_path
  end

  def destroy
    @task = Task.find(params[:id])

    @task.destroy

    redirect_to root_path
  end
end
