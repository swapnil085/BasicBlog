OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2,'894386507653-405bjdpis10g7v2och7hrla2ospg58g7.apps.googleusercontent.com','cz8ip9ACPt3AJG6OdSq5V-xE', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end
