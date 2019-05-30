class ApplicationController < ActionController::API
  include AbstractController::Helpers

  before_action :authenticate_user!
  helper_method :current_user

  private

  def authenticate_user!
    return if request.headers['HTTP_AUTH_TOKEN'].blank?
    @current_user ||= User.find_by_authentication_token(request.headers['HTTP_AUTH_TOKEN'])
  end

  def current_user
    @current_user
  end
end
