class NotificationsMailer < ActionMailer::Base
  default :to => "app-gallery@lists.berkeley.edu"

  def new_message(message)
  	@message = message
    mail(:from => message.email, :subject => "[CalApps] #{message.subject}")
  end
end