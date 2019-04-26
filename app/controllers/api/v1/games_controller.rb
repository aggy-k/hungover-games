class Api::V1::GamesController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token
  # before_action :set_user, except: [:index, :show]
  before_action :set_game, only: [:show, :update, :destroy]

  def index
    @games = Game.all
  end

  def show
  end

  def create
    @game = Game.new(game_params)
    @game.user = User.find(params[:user_id])
    # @game.timeslot = Timeslot.find(1)
    @game.game_status = GameStatus.find_by(is_active: params[:is_active]) # status: active
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
    @game.game_status = GameStatus.find_by(is_active: params[:is_active])
    if @game.update(game_params)
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
    params.require(:game).permit(:timeslot_id, :date, :signup_time, :description, :announcement, :game_status_id, :location, :max_capacity, :attendees_count, :user_id, :is_active, :end_time, :start_time)
  end

  def render_error
    render json: { errors: @game.errors.full_messages }, status: :unprocessable_entity
  end
end
