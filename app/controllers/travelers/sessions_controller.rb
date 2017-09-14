class Travelers::SessionsController < Devise::SessionsController
    skip_before_filter :require_no_authentication 


  #GET /resource/sign_in
  def new
    super
  end

  #POST /resource/sign_in
  def create
    super
  end

  #DELETE /resource/sign_out
  def destroy
    super
  end

  protected

  #You can put the params you want to permit in the empty array.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :email, :password, :confirmation_password, :encrypted_password
  # end
end
