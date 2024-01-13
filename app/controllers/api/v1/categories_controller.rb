class Api::V1::CategoriesController < ApplicationController
  before_action :authenticate_user_from_token!, only: [:index, :update, :create, :destroy]

  def index
    render json: Category.all
  end

  def create
    category = Category.new(category_params)

    return render json: { category: category }, status: :created if category.save

    render json: { errors: category.errors }, status: :unprocessable_entity
  end

  def update
    category = Category.find(params[:id])

    return render json: {}, status: :ok if category.update(category_params)

    render json: { errors: category.errors }, status: :unprocessable_entity
  end

  def destroy
    category = Category.find(params[:id])

    render json: {}, status: :no_content if category.destroy
  end

  private

  def category_params
    params.permit(:name, :description, :priority)
  end

end