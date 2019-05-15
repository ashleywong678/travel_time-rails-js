class SessionsController < ApplicationController

  def welcome #root view page
  end
  
  def new #login view page 
  end

  def create #logs user in
    @agency = Agency.find_by(id: params[:agency][:id])
    if logged_in?
      redirect_to agencies_main_path(@agency)
    elsif @agency && @agency.authenticate(params[:password])
      session[:user_id] = @agency.id
      redirect_to agencies_main_path(@agency)
    else
      render :new
    end
  end
  
  def destroy
    session.clear
    redirect_to root_path
  end

end
