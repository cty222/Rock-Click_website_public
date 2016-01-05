class ContactMailer < ApplicationMailer
  def customize(email_array, subject, content)
    @content = content
    
    mail(bcc: email_array, subject: subject)
  end
end
