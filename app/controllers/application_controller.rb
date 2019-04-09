class ApplicationController < ActionController::API
  before_action :make_action_mailer_use_request_host_and_protocol

  private

  def make_action_mailer_use_request_host_and_protocol
    uri = URI(ENV['CLIENT_HOST'])
    port = (uri.port != uri.default_port) && uri.port
    host = [uri.host, port].join(':')
    ActionMailer::Base.default_url_options[:protocol] = uri.scheme
    ActionMailer::Base.default_url_options[:host] = host
  end
end
