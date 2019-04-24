class Api::V1::GameStatusesController < Api::V1::BaseController
  def index
    @game_statuses = GameStatus.all
  end
end
