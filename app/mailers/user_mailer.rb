class UserMailer < ActionMailer::Base
  default from: "notifications@remindr.com"


  def remind_email(user, contacts)
    @user = user
    @contacts = contacts
    mail to: @user.email, subject: "Your weekly reminder"
  end

end
