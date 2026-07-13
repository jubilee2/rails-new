email = ENV.fetch("DEMO_LOGIN_EMAIL", "admin@example.com")
password = ENV.fetch("DEMO_LOGIN_PASSWORD", "password")

user = User.find_or_initialize_by(email: email)
user.password = password
user.password_confirmation = password
user.save!
