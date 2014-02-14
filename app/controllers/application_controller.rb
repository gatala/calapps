class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include SimpleCaptcha::ControllerHelpers

  before_filter :categories

  def categories
  	@categories = Calapp.categories
  end
end
