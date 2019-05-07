class Api::V1::GamesController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token
  before_action :set_user, only: [:update, :destroy]
  before_action :set_game, only: [:show, :update, :destroy]

  def index
    now = Time.now.utc
    @games = Game.all.where("end_time >= ?", now).order(date: :asc, start_time: :asc)
    @past_games = Game.all.where("end_time < ?", now).order(date: :desc, start_time: :desc)
  end

  def show
    @signed_up_count = 0
    @waitlist_count = 0
    @cancelled_count = 0
    @late_cancelled_count = 0
    @no_show_count = 0
    @removed_count = 0

    @game.signups.each do |s|
      if s.attendee_status.name == "Signed-up"
        @signed_up_count += 1
      elsif s.attendee_status.name == "Waitlisted"
        @waitlist_count += 1
      elsif s.attendee_status.name == "Cancelled"
        @cancelled_count += 1
      elsif s.attendee_status.name == "Late-cancelled"
        @late_cancelled_count += 1
      elsif s.attendee_status.name == "No-show"
        @no_show_count += 1
      else
        @removed_count += 1
      end
    end
  end

  def create
    @game = Game.new(game_params)
    @game.user = User.find(params[:user_id])

    # convert is_active to BOOLEAN
    @is_active = params[:is_active] == "true" || params[:is_active] == true
    @game.game_status = GameStatus.find_by(is_active: @is_active)

    # convert all time related fields to date or datetime datatype
    @game.start_time = Time.parse(params[:start_time])
    @game.end_time = Time.parse(params[:end_time])
    @game.date = Date.parse(params[:date])
    @game.signup_time = Time.parse(params[:signup_time])

    if @game.save
      render :show
    else
      render_error
    end
  end

  def update
    # convert is_active to BOOLEAN
    @is_active = params[:is_active] == "true" || params[:is_active] == true
    @game.game_status = GameStatus.find_by(is_active: @is_active)

    @game.description = params[:description]
    @game.announcement = params[:announcement]
    @game.location = params[:location]
    @game.max_capacity = params[:max_capacity]
    @game.start_time = Time.parse(params[:start_time])
    @game.end_time = Time.parse(params[:end_time])
    @game.date = Date.parse(params[:date])
    @game.signup_time = Time.parse(params[:signup_time])


    if @game.save
      render :show
    else
      render_error
    end
  end

  def destroy
    @game.destroy
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def game_params
    params.require(:game).permit(:date, :signup_time, :description, :announcement, :location, :max_capacity, :user_id, :is_active, :end_time, :start_time)
  end

  def render_error
    render json: { errors: @game.errors.full_messages }, status: :unprocessable_entity
  end
end
