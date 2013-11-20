config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
        :address              => "smtp.gmail.com",
        :port                 => 587,
        :domain               => "calapps2.herokuapp.com",
        :user_name            => "cs169badjr@gmail.com",
        :password             => "saasbook",
        :authentication       => :plain,
        :enable_starttls_auto => true
}
