class MagicLinksMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.magic_links_mailer.magic_link.subject
  #
  def magic_link(user)
    @user = user.decorate
    @magic_link = token_login_url(token: user.login_token)

    mail to: user.email,
      subject: default_i18n_subject(
        user: @user.to_label,
        app_name: Rails.application.config.app_name
    )
  end
end
