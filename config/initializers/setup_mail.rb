require 'mail'

ActionMailer::Base.smtp_settings = {
  :address            => ENV["SMTP_ADDRESS"],
  :port               => 587,
  :domain             => ENV['SMTP_DOMAIN'],
  :authentication     => :plain,
  :user_name          => ENV['SMTP_USERNAME'],
  :password           => ENV['SMTP_PASSWORD'],
  :enable_starttls_auto => true
}

require File.join( Rails.root, 'lib', 'development_mail_interceptor')
Mail.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?