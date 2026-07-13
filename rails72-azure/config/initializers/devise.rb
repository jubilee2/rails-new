# frozen_string_literal: true

Devise.setup do |config|
  # Load Devise's Active Record integration so models can call the `devise` macro.
  require "devise/orm/active_record"

  config.mailer_sender = "please-change-me@example.com"
  # Match Devise's Rails 7/Turbo defaults so successful sign-in redirects are
  # followed as GET requests instead of replaying the login form submission.
  config.responder.error_status = :unprocessable_entity
  config.responder.redirect_status = :see_other

  config.sign_out_via = :delete
end
