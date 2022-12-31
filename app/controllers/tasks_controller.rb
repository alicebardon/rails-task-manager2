class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save

    if @task.save
      redirect_to task_path(@task), notice: "Task was successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)

    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    if @task.destroy
      redirect_to tasks_path, status: :see_other, notice: "Task was successfully deleted"
    else
      render :destroy, status: :unprocessable_entity
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end

end
