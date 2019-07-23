class Api::V1::SignupsController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token
  before_action :set_user, only: [:create, :cancel_signup]
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
    count = @user.signups.where(game: @game).count
    count_signed_up = @user.signups.where(game: @game, attendee_status: set_status('Signed-up')).count

    if count.zero?
      @signup.player = @user.username
    else
      @signup.player = "#{@user.username} +#{count}"
    end

    # Add logic : only first 2 signups go straight to game for each user
    # Add logic : if a spot becomes available because of cancellation, new signup still goes to waitlist

    # Add logic to count whether status is 1 or 2
    attendees_count = @game.signups.count { |signup| signup.attendee_status.name == "Signed-up" }
    waitlist_count = @game.signups.count { |signup| signup.attendee_status.name == "Waitlisted" }
    original_count = (@game.signups.count { |signup| (signup.previous_status == "Signed-up") && ((signup.attendee_status.name == "Cancelled") || (signup.attendee_status.name == "Late-cancelled")) }) + attendees_count

    # add logic for original signup count, where status is or was Signed-up
    if (original_count >= @game.max_capacity)
      # if there are spots and no waitlist
      if (attendees_count < @game.max_capacity) && (waitlist_count.zero?)
        @signup.attendee_status = max_two(count_signed_up)
      else
        @signup.attendee_status = set_status('Waitlisted')
      end
    else
      @signup.attendee_status = max_two(count_signed_up)
    end

    unless @signup.save
      render_error
    end
  end

  def update
    @signup = Signup.find(params[:id])
    last_status = @signup.attendee_status.name
    @signup.previous_status = last_status
    @signup.attendee_status = @attendee_status unless params[:attendee_status].nil?
    @signup.player = params[:player] unless params[:player].nil?
    @signup.is_paid = params[:is_paid] unless params[:is_paid].nil?

    unless @signup.save
      render_error
    end
  end

  def cancel_signup
    game = Game.find(params[:game_id])
    user = current_user
    attendee_status = set_status(params[:attendee_status])
    signup = game.signups.where(user: user, attendee_status: attendee_status).last

    new_status = signup.late_cancelled? ? 'Late-cancelled' : 'Cancelled'

    unless signup.update(
      attendee_status: set_status(new_status),
      previous_status: params[:attendee_status]
      )
      render_error
    end
  end

  private

  def set_status(status)
    AttendeeStatus.find_by(name: status)
  end

  def max_two(count_signed_up)
    if count_signed_up < 2
      set_status('Signed-up')
    else
      set_status('Waitlisted')
    end
  end

  def set_attendee_status
    @attendee_status = AttendeeStatus.find_by(name: params[:attendee_status]) unless params[:attendee_status].nil?
  end

  def set_user
    @user = current_user
  end

  def set_game
    @game = Game.find(params[:game_id])
  end

  def signup_params
    params.require(:signup).permit(:game_id, :user_id, :attendee_status, :player, :is_paid)
  end

  def render_error
    render json: { errors: @signup.errors.full_messages }, status: :unprocessable_entity
  end
end
