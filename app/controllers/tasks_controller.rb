class TasksController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]

  def index
    #if logged_in?
      #@tasks = current_user.tasks.build
      @tasks = current_user.tasks.order(id: :desc).page(params[:page])
      #binding.pry
    #end
  end
  
  def show 
    #binding.pry
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to root_url
    end
      
  end

  def new
      @task = current_user.tasks.new
  end

  def create
      @task = current_user.tasks.build(task_params)
      
      if @task.save
          flash[:success] = 'タスクが正常に投稿されました'
          redirect_to root_url
      else
          @tasks = current_user.tasks.order(id: :desc).page(params[:page])
          flash.now[:danger] = 'タスクが投稿されませんでした'
          render :new
      end
  end

  def edit
      @task = current_user.tasks.find(params[:id])
  end

  def update
      @task = current_user.tasks.find(params[:id])
      
      if @task.update(task_params)
          flash[:success] = 'タスクが正常に更新されました'
          redirect_to @task
      else
          flash.now[:danger] = 'タスクが更新されませんでした'
          render :edit
      end
  end

  def destroy
      @task = current_user.tasks.find(params[:id])
      @task.destroy
      flash[:success] = 'タスクは正常に削除されました'
      #redirect_back(fallback_location: root_path)
      redirect_to root_url
  end
  
  private
  
  #Strong Parameter
  def task_params
      params.require(:task).permit(:content, :status)
  end
  
  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to root_url
    end
  end
  
  def set_task
    @task = current_user.tasks.find(params[:id])
  end
    
end
