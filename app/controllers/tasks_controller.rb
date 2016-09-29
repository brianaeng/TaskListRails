class TasksController < ApplicationController
  # skip_before_filter :verify_authenticity_token #NOT SURE IF NEEDED??

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

    @status = nil
    
    if @task[:completion] == true
      @status = "Done at #{@task[:completed_at]}"
    else
      @status = "Still in progress"
    end
  end

  def create
  end

  def new
  end

  def edit
    show
  end

  def update
    show
  end

  def destroy
  end

  def self.alltasks
    [
      {id: 1, title: "Do app", description: "Creating rails app", completion: true, completed_at: "noon 9/28"},
      {id: 2, title: "Eat", description: "Eat food", completion: false, completed_at: nil},
      {id: 3, title: "Sleep", description: "Get lots of sleep", completion: true, completed_at: "8am 9/27"}
    ]
  end
end
