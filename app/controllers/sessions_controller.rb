class SessionsController < Devise::SessionsController
  # POST /resource/sign_in
  def create
    cookies[:sign_in] = 1
    super
  end

  # GET /resource/sign_out
  def destroy
    cookies[:sign_in] = 0
    super
  end
end