class Corelogic::Session

  @@login_url = "https://api-prod.corelogic.com/oauth/token?grant_type=client_credentials"

  def initialize consumer_key, consumer_secret
    @consumer_key = consumer_key
    @consumer_secret = consumer_secret
    @access_token = nil
    @expires_in = nil
    self.login
  end

  def get_auth_details
    "#{@consumer_key}:#{@consumer_secret}"
  end

  def current_time
    Process.clock_gettime(Process::CLOCK_MONOTONIC)
  end

  def token
    @access_token
  end

  def login
    begin
      resp = HTTParty.post(@@login_url, basic_auth: {
        username: @consumer_key,
        password: @consumer_secret
      })
      resp_body = JSON.parse(resp.body)
      @access_token = resp_body["access_token"]
      @expires_in = self.current_time + resp_body["expires_in"].to_f
      return true
    rescue RestClient::ExceptionWithResponse => e
      puts "Failed login with", e.response
      false
    end
  end

  def is_active?
    return false if @access_token.to_s.empty?
    if self.current_time > @expires_in
      return false
    end
    true
  end

end
