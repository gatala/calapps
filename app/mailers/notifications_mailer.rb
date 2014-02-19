class NotificationsMailer < ActionMailer::Base
  default :to => "cs169badjr@gmail.com"

  def new_message(message)
  	@message = message
    mail(:from => message.email, :subject => "[CalApps] #{message.subject}")
  end
end