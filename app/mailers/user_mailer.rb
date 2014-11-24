class UserMailer < ActionMailer::Base
  default from: "notifications@remindr.com"

  def remind_email(user)
    @user = User.find_by_id user
    mail to: "#{@user.name} <#{@user.email}>", subject: "Your weekly reminder"
  end

end
