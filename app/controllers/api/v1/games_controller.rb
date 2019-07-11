class Api::V1::GamesController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token
  before_action :set_user, only: [:update, :destroy, :show_user_signups]
  before_action :set_game, only: [:show, :update, :destroy, :show_user_signups]

  def index
    now = Time.now.utc
    if params[:user_id].nil?
      if params[:is_private].nil?
        @games = Game.all.where("end_time >= ?", now).order(date: :desc, start_time: :desc)
        @past_games = Game.all.where("end_time < ?", now).order(date: :desc, start_time: :desc)
      else
        @games = Game.all.where("is_private = ? AND end_time >= ?", false, now).order(date: :desc, start_time: :desc)
        @past_games = Game.all.where("is_private = ? AND end_time < ?", false, now).order(date: :desc, start_time: :desc)
      end
    else
      @user_id = params[:user_id]
      @games = Game.all.joins("INNER JOIN signups ON games.id = signups.game_id").where("signups.user_id = ? AND games.end_time >= ?", @user_id, now).group("games.id").order("games.end_time ASC")
      @past_games = Game.all.joins("INNER JOIN signups ON games.id = signups.game_id").where("signups.user_id = ? AND games.end_time < ?", @user_id, now).group("games.id").order("games.end_time ASC")
    end
  end

  def show
  end

  def show_user_signups
    @attendees = @game.signups.order("signups.id ASC").select {|s| s.user == @user}
  end

  def create
    @game = Game.new(game_params)
    @game.user = User.find(params[:user_id])

    # convert STRING to BOOLEAN
    @is_active = params[:is_active] == "true" || params[:is_active] == true
    @game.game_status = GameStatus.find_by(is_active: @is_active)
    @game.is_private = params[:is_private] == "true" || params[:is_private] == true

    # convert all time related fields to date or datetime datatype
    @game.start_time = Time.parse(params[:start_time])
    @game.end_time = Time.parse(params[:end_time])
    @game.date = Date.parse(params[:date])
    @game.signup_time = Time.parse(params[:signup_time])
    @game.location = Location.find_by(name: 'Cages')

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

    @game.is_private = params[:is_private] == "true" || params[:is_private] == true

    @game.description = params[:description]
    @game.announcement = params[:announcement]
    # @game.location = params[:location]
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
    params.require(:game).permit(:date, :signup_time, :description, :announcement, :max_capacity, :user_id, :is_active, :end_time, :start_time, :is_private)
  end

  def render_error
    render json: { errors: @game.errors.full_messages }, status: :unprocessable_entity
  end
end
