ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "calapps2.herokuapp.com",
  :user_name            => "cs169badjr",
  :password             => "saasbook",
  :authentication       => "plain",
  :enable_starttls_auto => true
}
