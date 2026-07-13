class SessionsController < ApplicationController
  def new
  end

  def create
    if valid_demo_credentials?
      session[:user_email] = params[:email]
      redirect_to root_path, notice: "Signed in successfully."
    else
      flash.now[:alert] = "Invalid email or password."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    reset_session
    redirect_to login_path, notice: "Signed out successfully."
  end

  private

  def valid_demo_credentials?
    params[:email] == demo_email && params[:password] == demo_password
  end

  def demo_email
    ENV.fetch("DEMO_LOGIN_EMAIL", "admin@example.com")
  end

  def demo_password
    ENV.fetch("DEMO_LOGIN_PASSWORD", "password")
  end
end
