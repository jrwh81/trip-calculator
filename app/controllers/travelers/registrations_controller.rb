class Travelers::RegistrationsController < Devise::RegistrationsController
#before_filter :configure_sign_up_params, only: [:create]
before_action :configure_permitted_paramters, only: [:create, :complete_signup, :edit, :update]
#before_filter :configure_account_update_params, only: [:update]

  #GET /travelers/sign_up
  def new
    super
  end

  #POST /travelers
  def create
    @traveler = Traveler.new(traveler_params)
    super
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  def configure_permitted_paramters
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:first_name, :last_name, :password, :password_confirmation)} 
    #devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:new_email, :confirm_new_email) }
    #devise_parameter_sanitizer.for(:update) {|u| u.permit(:cancel_membership)}
  end  

  private

  def traveler_params
    params.require(:traveler).permit(:first_name, :last_name, :password, :password_confirmation)
  end


  # You can put the params you want to permit in the empty array.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.for(:sign_up) << :attribute
  # end

  # You can put the params you want to permit in the empty array.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :attribute
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
