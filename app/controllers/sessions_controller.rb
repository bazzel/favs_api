class SessionsController < ApplicationController
  def create
    email = params[:data][:attributes][:email]
    @user = User.find_or_create_by!(email: email)
    @user.update!(login_token: SecureRandom.urlsafe_base64,
                 login_token_valid_until: 30.minutes.from_now)

    SessionsMailer.magic_link(@user).deliver
    render json: JSONAPI::ResourceSerializer.new(SessionResource).serialize_to_hash(SessionResource.new(@user, nil)), status: :created
  end
end
