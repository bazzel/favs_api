class SessionsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
  deserializable_resource :user

  def create
    email = params[:user][:email]
    @user = User.find_or_create_by!(email: email)
    @user.update!(login_token: SecureRandom.urlsafe_base64,
                  login_token_valid_until: 30.minutes.from_now)

    SessionsMailer.magic_link(@user).deliver
    render jsonapi: @user, class: { User: SerializableSession }
  end

  private
  def record_invalid(error)
    render jsonapi_errors: error.record.errors, status: :unprocessable_entity
  end
end
