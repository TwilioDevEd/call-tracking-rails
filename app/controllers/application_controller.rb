class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :create_app_if_required

  private

  def create_app_if_required
    @client = TwilioClient.new
    unless ENV["TWIML_APPLICATION_SID"]
      applications = @client.list_applications(
        friendly_name: TwilioClient::DEFAULT_APPLICATION_NAME
      )
      if applications.any?
        application = applications.first
        application.update(:voice_url => "#{request.base_url}/call-tracking/forward-call")
        ENV["TWIML_APPLICATION_SID"] = application.sid
      else
        application = @client.create_default_application(
          :voice_url => "#{request.base_url}/call-tracking/forward-call"
        )
        ENV["TWIML_APPLICATION_SID"] = application.sid
      end
    end
  end
end
