class Api::V1::UsersController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token
  before_action :set_user, only: [:show, :update]

  def show

  end

  def update
    unless @user.update(user_params)
      render_error
    end
  end

  private

  def set_user
   @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:profile_image, :username, :first_name, :last_name)
  end

  def render_error
    render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
  end
end
