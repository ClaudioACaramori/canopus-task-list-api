class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user_from_token!, only: [:show, :update, :create, :destroy]

  def create
    user = User.new(user_params)

    return render json: { user: user }, status: :created if user.save

    render json: { errors: user.errors }, status: :unprocessable_entity
  end

  def index
    render json: User.all
  end

  def show
    render json: User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    return render json: {}, status: :ok if user.update(user_params)

    render json: { errors: user.errors }, status: :unprocessable_entity
  end

  def destroy
    user = User.find(params[:id])

    render json: {}, status: :no_content if user.destroy
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation, :username, :profile)
  end

end
