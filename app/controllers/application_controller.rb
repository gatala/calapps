class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include SimpleCaptcha::ControllerHelpers

  before_filter :categories, :all_tags

  def categories
  	@categories = Calapp.categories
  end

  def all_tags
    @all_tags = ActsAsTaggableOn::Tag.all.map { |tag| tag.name }
  end

end
