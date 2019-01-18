class ApplicationMailer < ActionMailer::Base
  default from: 'noreply@gobarbecue.herokuapp.com'

  layout 'mailer'
end
