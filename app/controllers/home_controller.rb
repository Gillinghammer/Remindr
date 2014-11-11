class HomeController < ApplicationController
  def index
    @contacts = current_user.contacts if user_signed_in?
  end
end
