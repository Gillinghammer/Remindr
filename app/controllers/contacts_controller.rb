class ContactsController < ApplicationController
  # before_action :athenticate_user!

  def index
    # @contacts = current_user.contacts if user_signed_in? // TODO Fix devise sign out bug after AJAX
    @contacts = User.find_by_email("homer@simpsons.com").contacts
    # @contacts.each do |contact|
    #   contact.remind_on = DateTime.now + @contact.remind_interval
    respond_to do |format|
      format.json { render :json => @contacts }
    end
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.status = "This is awkward."
    @contact.remind_on = DateTime.now + @contact.remind_interval
    respond_to do |format|
      if @contact.save
        format.json { render json: @contact }
        # format.html {render 'home#index'}
      end
    end
  end

  def destroy
        @contact = Contact.find(params[:id])
        @contact.destroy
        render json: @contact
     end
end
