email = ENV.fetch("DEMO_LOGIN_EMAIL", "admin@example.com")
password = ENV.fetch("DEMO_LOGIN_PASSWORD", "password")

User.find_or_create_by!(email:) do |user|
  user.password = password
  user.password_confirmation = password
end
