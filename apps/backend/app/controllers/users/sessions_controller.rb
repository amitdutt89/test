# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    before_action :validate_recaptcha, only: [:create]

    # GET /resource/sign_in
    def new
      @g_captcha_client_token = ENV["GOOGLE_CAPTCHA_CLIENT_TOKEN"]
      super
    end

    # POST /resource/sign_in
    # def create
    #   super
    # end

    # DELETE /resource/sign_out
    # def destroy
    #   super
    # end

    # protected

    # If you have extra params to permit, append them to the sanitizer.
    # def configure_sign_in_params
    #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
    # end
    def after_sign_in_path_for(_resource)
      root_path
    end

    private

    def validate_recaptcha
      @g_captcha_server_token = ENV["GOOGLE_CAPTCHA_SERVER_TOKEN"] 
      resp = RestClient.post('https://www.google.com/recaptcha/api/siteverify', {
                               response: params['g-recaptcha-response'],
                               secret: @g_captcha_server_token
                             })
      return unless JSON.parse(resp.body)['success'].eql? false

      flash[:notice] = 'Recaptcha not checked'
      redirect_to new_user_session_path
    end
  end
end
