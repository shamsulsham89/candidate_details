ActionMailer::Base.smtp_settings = {
  :address => "smtp.gmail.com",
  :port  => 587,
  :domain  => 'localhost:3000',
  :user_name => "abstractsurvey@gmail.com",
  :password => "",
  :authentication => 'plain',
  :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = "intense-escarpment-3610.herokuapp.com/"
#Mail.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?

class OverrideMailRecipient
  def self.delivering_email(mail)
    mail.to = 'abstractsurvey@gmail.com'
  end
end
unless Rails.env.production?
 ActionMailer::Base.register_interceptor(OverrideMailRecipient)
end

