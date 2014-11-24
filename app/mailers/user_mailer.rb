class UserMailer < ActionMailer::Base
  default from: "notifications@remindr.com"

  def remind_email(user)
    @user = User.find_by_id user
    @contacts = @user.contacts.remind_this_week
    mail(to: "#{@user.name} <#{@user.email}>", subject: "Your weekly reminder") unless @contacts.empty?
  end

end
