class Api::V1::AccessController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token
  # URL = "https://api.weixin.qq.com/sns/jscode2session".freeze
  appid = ENV["APP_ID"]
  secret = ENV["APP_SECRET"]

  URL = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=#{appid}&secret=#{secret}"

  def access
    @wechat_response ||= RestClient.get(URL)
    @wechat_access ||= JSON.parse(@wechat_response.body)
    render json: {
      access: @wechat_access
    }
  end
end
