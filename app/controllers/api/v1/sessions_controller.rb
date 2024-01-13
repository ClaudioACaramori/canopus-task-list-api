class Api::V1::SessionsController < ApplicationController
  def create
    response_handler(Users::CreateSession.call(session_params))
  end

  private

  def session_params
    params.permit(:email, :password)
  end

  def response_handler(response)
    if response.success?
      sign_in response.result, store: false
      token = response.result.refresh_token
      render json: response.result, status: :ok, scope: response.result
    else
      render json: { errors: response.errors }, status: :unprocessable_entity
    end
  end

end
