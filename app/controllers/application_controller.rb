class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  after_action :verify_authorized, unless: :devise_controller?

  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :handle_not_authorized

  private

  def handle_not_authorized
    flash[:notice] = "You are not authorized to perform this action."
    redirect_to root_path
  end
end
