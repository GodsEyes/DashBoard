class TasksController < ApplicationController

  http_basic_authenticate_with name: "root", password: "root", only: :destroy

  def create
    @branch=Branch.find(params[:branch_id])
    @task=@branch.tasks.create(task_params)
    redirect_to branch_path(@branch)
  end

  def destroy
    @branch=Branch.find(params[:branch_id])
    @task=@branch.tasks.find(params[:id])
    @task.destroy
    redirect_to branch_path(@branch)
  end

  private
  def task_params
    params.require(:task).permit(:name,:status)
  end
end
