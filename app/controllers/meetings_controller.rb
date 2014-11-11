class MeetingsController < ApplicationController
  
  def create
    @meeting = Meeting.new(params[:meeting])
    respond_to do |format|
      if @meeting.save
        @contact  = Contact.find_by_id(@meeting.contact_id)
        @contact.remind_on = DateTime.now + @contact.remind_interval
        # @contact.remind_in = ((DateTime.now + @contact.remind_interval) - DateTime.now).to_i
        @contact.last_meeting = @meeting.created_at
        if @contact.meetings.count >= 5
          @contact.status = 'My BFF'
        elsif @contact.meetings.count < 5 && @contact.meetings.count >= 2
          @contact.status = "We're good..."
        else
          @contact.status = "This is awkward."
        end
        @contact.save
        puts @contact.last_meeting
        format.json { render json: @meeting }
      end
    end
  end
end
