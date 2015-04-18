class TaskController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task.project }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def show
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task.project }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete
    @task.destroy
    respond_to do |format|
      # change redirection
      format.html { redirect_to root_url, notice: 'Task was successfully destroyed.' }
    end
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(
        :title,
        :description,
        :created_by,
        :modified_by,
        :completed,
        :completed_on,
        :assign_to,
        :project_id,
        :workspace_id,
        :due_on
        )
    end

end