class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:activity,:weekend,:living,:sharing,:visitor,:sparetime,:noiselevel,:studywhere,:wakeup,:sleep,:drink,:schoolname, :personname,:major,:age,:grade,:smoke, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:activity,:weekend,:living,:sharing,:visitor,:sparetime,:noiselevel,:studywhere,:wakeup,:sleep,:drink,:schoolname, :personname,:major,:age,:grade, :smoke, :email, :password, :password_confirmation, :remember_me, :current_password) }
  end



  helper_method :mailbox, :conversation

  private

  def mailbox
    @mailbox ||= current_user.mailbox
  end

  def conversation
    @conversation ||= mailbox.conversations.find(params[:id])
  end

  protected




end
