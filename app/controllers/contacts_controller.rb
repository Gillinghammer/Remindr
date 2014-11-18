class ContactsController < ApplicationController

  def index
    if current_user
      @contacts = current_user.contacts
    else
      redirect_to new_user_session_path
    end
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
