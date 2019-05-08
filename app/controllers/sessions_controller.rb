class SessionsController < ApplicationController
  def create
    user = User.valid_with_token(params[:token])

    if user
      user.invalidate_token

      data = {id: user.id, email: user.email, name: user.name }
      payload = { data: data, sub: user.id, exp: 2.hours.from_now.to_i }
      token = JWT.encode(payload, JWT_SECRET, 'HS512')

      render json: { token: token }
    else
      # Implement else branch?
    end
  end
end
