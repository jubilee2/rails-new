# frozen_string_literal: true

Devise.setup do |config|
  # Load Devise's Active Record integration so models can call the `devise` macro.
  require "devise/orm/active_record"

  config.mailer_sender = "please-change-me@example.com"
  config.sign_out_via = :delete
end
