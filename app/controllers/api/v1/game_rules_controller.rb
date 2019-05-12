class Api::V1::GameRulesController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token

  def index
    @game_rule = GameRule.all.last
  end

  def create
    @game_rule = GameRule.new(game_rule_params)
    @user = User.find(params[:user_id])
    @game_rule.user = @user
    @game_rule.save

    unless @game_rule.save
      render_error
    end
  end

  private

  def game_rule_params
    params.require(:game_rule).permit(:title, :content, :user_id)
  end

  def render_error
    render json: { errors: @game_rule.errors.full_messages }, status: :unprocessable_entity
  end
end
