class Api::V1::TaskItemsController < ApplicationController
  before_action :authenticate_user_from_token!, only: [:index, :update, :create, :destroy]

  def index
    return render json: TaskItem.all if current_user.admin?

    render json: current_user.task_items
  end

  def create
    task = current_user.task_items.new(task_params)

    return render json: { task: task }, status: :created if task.save

    render json: { errors: task.errors }, status: :unprocessable_entity
  end

  def update
    task = TaskItem.find(params[:id])

    return render json: {}, status: :ok if task.update(task_params)

    render json: { errors: task.errors }, status: :unprocessable_entity
  end

  def destroy
    task = TaskItem.find(params[:id])

    render json: {}, status: :no_content if task.destroy
  end

  private

  def task_params
    params.permit(:category_id, :description, :priority, :status, :expires_at, :annotations)
  end

end