class Api::V1::MessagesController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token

  def create
    @message = Message.new
    @message.to_username = params[:ToUserName]
    @message.from_username = params[:FromUserName]
    @message.create_time = params[:CreateTime]
    @message.msg_type = params[:MsgType]
    @message.content = params[:Content]
    @message.msg_id = params[:MsgId]

    unless @message.save
      render_error
    end
  end

  private

  def message_params
    params.require(:message).permit(:ToUserName, :FromUserName, :CreateTime, :MsgType, :Content, :MsgId, :PicUrl, :MediaId, :Title, :AppId, :PagePath, :ThumbUrl, :ThumbMediaId, :Event, :SessionForm)
    # :to_username, :from_username, :create_time, :msg_type, :content, :msg_id
  end

  def render_error
    render json: { errors: @message.errors.full_messages }, status: :unprocessable_entity
  end
end
