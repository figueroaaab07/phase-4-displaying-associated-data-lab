class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def show
    user = User.find(params[:id])
    render json: user, except: [:created_at, :updated_at], include: [items: { except: [:user_id, :created_at, :updated_at]}]
  end

  private

  def render_not_found_response
    render json: { error: "User not found" }, status: :not_found
  end

end
