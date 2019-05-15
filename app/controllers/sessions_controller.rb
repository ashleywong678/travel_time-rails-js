class SessionsController < ApplicationController

  def welcome #root page
  end
  
  def new #login view page 
    # @agency = Agency.new
  end

  def create #logs user in
  end
  
  def destroy
    session.clear
    redirect_to root_path
  end

end
