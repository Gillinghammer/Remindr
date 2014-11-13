class Contact < ActiveRecord::Base
  attr_accessible :avatar, :email, :name, :user_id, :status, :last_meeting, :reminder_countdown, :remind_on, :remind_interval, :contact_type
  belongs_to :user
  has_many :meetings

  scope :remind_this_week, -> { where('remind_on = ?', Date.today+7) }

  delegate :drink_count, to: :meetings

  def drink_count
    self.meetings.count
  end

  def remind_count

  end


end
