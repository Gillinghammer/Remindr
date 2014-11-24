task :remind => :environment do
  desc "This is the weekly reminder email"
  UserMailer.remind_email(1).deliver!
  puts "Email Sent"
end