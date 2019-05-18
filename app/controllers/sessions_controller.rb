class SessionsController < ApplicationController

  def welcome #root view page
  end
  
  def new #login view page 
  end

  def create #logs user in
    if auth['uid']
      agency = Agency.find_or_create_by(uid: auth['uid']) do |a|
        a.name = auth['info']['name']
      end
      session[:user_id] = @agency.id
      redirect_to agencies_main_path(@agency)
    else
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
  end
  
  def destroy
    session.clear
    redirect_to root_path
  end

  private

    def auth
      request.env['omniauth.auth']
    end

end
