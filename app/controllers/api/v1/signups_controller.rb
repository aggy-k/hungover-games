class Api::V1::SignupsController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token
  before_action :set_user, only: [:create]
  before_action :set_game, only: [:create, :update]
  before_action :set_attendee_status, only: [:create, :update]

  def index
    now = Time.now.utc
    user_id = params[:user_id]
    @signups = Signup.joins("INNER JOIN games ON games.id = signups.game_id").where("signups.user_id = ? AND games.end_time >= ?", user_id, now).order("games.start_time DESC")
    @past_signups = Signup.joins("INNER JOIN games ON games.id = signups.game_id").where("signups.user_id = ? AND games.end_time < ?", user_id, now).order("games.start_time DESC")
  end

  def show
    @signup = Signup.find(params[:id])
  end

  def create
    @signup = Signup.new()
    @signup.user = @user
    @signup.game = @game
    # @signup.attendee_status = @attendee_status
    # Add logic to count whether status is 1 or 2
    if (@game.attendees_count >= @game.max_capacity) || (@game.waitlist_count > 0)
      attendee_status = AttendeeStatus.find_by(name: 'Waitlisted')
      @signup.attendee_status = attendee_status
    else
      attendee_status = AttendeeStatus.find_by(name: 'Signed-up')
      @signup.attendee_status = attendee_status
    end

    if @signup.save
      @game.update(total_headcount: @game.signups.count)
      if attendee_status.name == "Signed-up"
        @game.update(attendees_count: @game.attendees_count + 1)
      elsif attendee_status.name == "Waitlisted"
        @game.update(waitlist_count: @game.waitlist_count + 1)
      end
    else
      render_error
    end
  end

  def update
    @signup = Signup.find(params[:id])
    last_status = @signup.attendee_status.name
    @signup.attendee_status = @attendee_status

    if @signup.save
      if (last_status == "Signed-up") && !(params[:attendee_status] == "Signed-up")
        @game.update(attendees_count: @game.attendees_count - 1)
      elsif (last_status == "Waitlisted") && !(params[:attendee_status] == "Waitlisted")
        @game.update(waitlist_count: @game.waitlist_count - 1)
      end

      if params[:attendee_status] == "Signed-up"
        @game.update(attendees_count: @game.attendees_count + 1)
      elsif params[:attendee_status] == "Waitlisted"
        @game.update(waitlist_count: @game.waitlist_count + 1)
      end
    else
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
