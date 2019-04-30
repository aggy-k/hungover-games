class Api::V1::SignupsController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token
  before_action :set_user
  before_action :set_game, only: [:create, :update]
  before_action :set_attendee_status, only: [:create, :update]

  def index
    @signups = @user.signups
  end

  def create
    @signup = Signup.new()
    @signup.user = @user
    @signup.game = @game
    @signup.attendee_status = @attendee_status

    if @signup.save
      @game.update(attendees_count: @game.signups.count)
    else
      render_error
    end
  end

  def update
    @signup = Signup.find(params[:id])
    @signup.attendee_status = @attendee_status

    unless @signup.save
      render_error
    end
  end

  private

  def set_attendee_status
    @attendee_status = AttendeeStatus.find_by(name: params[:attendee_status])
  end

  def set_user
    @user = current_user
  end

  def set_game
    @game = Game.find(params[:game_id])
  end

  def signup_params
    params.require(:signup).permit(:game_id, :user_id, :attendee_status)
  end

  def render_error
    render json: { errors: @signup.errors.full_messages }, status: :unprocessable_entity
  end
end
