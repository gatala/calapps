class NotificationsMailer < ActionMailer::Base
  default :to => "cs169badjr@gmail.com"

  def new_message(message)
  	@message = message
    mail(:subject => "[CalApps] #{message.subject}")
  end
end