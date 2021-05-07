class ApplicationController < ActionController::API
  skip_before_action :authorize_request, only: :authenticate, raise: false
  include Response
  include ExceptionHandler

  before_action :authorize_request
  attr_reader :current_user

  private

  def authorize_request
    @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
  end
end
