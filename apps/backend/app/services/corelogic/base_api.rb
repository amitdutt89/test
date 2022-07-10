class Corelogic::BaseApi

  @@retries = 3

  def initialize
    consumer_key = ENV["CORELOGIC_CONSUMER_KEY"]
    consumer_secret = ENV["CORELOGIC_CONSUMER_SECRET"]
    @session = Rails.cache.fetch("corelogic_session", expires_in: 30.minutes) do
      Corelogic::Session.new(consumer_key, consumer_secret)
    end
  end

  def get_headers
    {
      "Authorization": "Bearer #{@session.token}"
    }
  end

  def execute method, url, payload
    if not @session.is_active?
      @session.login
    end
    resp = RestClient::Request.execute(method: method,
                                       url: url,
                                       payload: payload,
                                       headers: self.get_headers)
    return resp
  end

end
