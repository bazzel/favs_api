class SessionsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

  def create
    email = params[:email]
    @user = User.find_or_create_by!(email: email)
    @user.update!(login_token: SecureRandom.urlsafe_base64,
                  login_token_valid_until: 30.minutes.from_now)

    SessionsMailer.magic_link(@user).deliver
    render status: :created
  end

  private
  def record_invalid(error)
    json_errors = error.record.errors.messages.map { | k,v | {title: k, detail: v}}
    render json: { errors: json_errors},
      status: :unprocessable_entity
  end
end
