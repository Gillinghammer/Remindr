class Contact < ActiveRecord::Base
  attr_accessible :avatar, :email, :name, :user_id, :status, :last_meeting, :reminder_countdown, :remind_on, :remind_interval
  belongs_to :user
  has_many :meetings

  delegate :drink_count, to: :meetings

  def drink_count
    self.meetings.count
  end

  def remind_count

  end


end
