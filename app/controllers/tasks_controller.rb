class TasksController < ApplicationController
  def index
    @alltasks = TasksController.alltasks
  end

  def show
    @alltasks = TasksController.alltasks
    @task = nil

    num = params[:id].to_i

    @alltasks.each do |task|
      if task[:id] == num
        @task = task
      end
    end

    if @task == nil
      render :file => 'public/404.html', :status => :not_found, :layout => false
    end
  end

  def create
  end

  def new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def self.alltasks
    [
      {id: 1, title: "Do app", description: "Creating rails app", completion: true, completed_at: "9/28"},
      {id: 2, title: "Eat", description: "Eat food", completion: false, completed_at: nil},
      {id: 3, title: "Sleep", description: "Get lots of sleep", completion: true, completed_at: "9/27"}
    ]
  end
end
