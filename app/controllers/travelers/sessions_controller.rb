class Travelers::SessionsController < Devise::SessionsController
    skip_before_filter :require_no_authentication
    #skip_before_filter :verify_authenticity_token 


  #GET /resource/sign_in
  def new
    super
  end

  #POST /resource/sign_in
  def create
    traveler = Traveler.find_by_user_name(params[:traveler][:user_name])
    if traveler && traveler.authenticatable_salt
      sign_in traveler
      redirect_to root_path
    else
      flash.now[:alert] = 'Unable to log in, please check user name/password'
      render 'new'
    end
  end

  #DELETE /resource/sign_out
  def destroy
    super
  end

  private 

  #You can put the params you want to permit in the empty array.
  def configure_sign_in_params
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:user_name, :password, :password_confirmation, :remember_me) }
  end
end
