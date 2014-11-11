class Meeting < ActiveRecord::Base
  attr_accessible :meeting_date, :contact_id, :user_id, :drink_count

  belongs_to :contact
  belongs_to :user

end
