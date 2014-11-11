class ContactSerializer < ActiveModel::Serializer
  attributes :id, :avatar, :email, :name, :user_id, :status, :last_meeting, :remind_on, :drink_count, :remind_interval

end
