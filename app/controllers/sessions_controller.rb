class SessionsController < ApplicationController

  def welcome #root view page
  end
  
  def new #login view page
    @agencies = Agencies.all
  end

  def create #logs user in
    @agency = Agency.find_by(id: params[:agency][:id])
      if logged_in?
        redirect_to agencies_main_path(@agency)
      elsif @agency && @agency.authenticate(params[:password])
        session[:user_id] = @agency.id
        redirect_to agencies_main_path(@agency)
      else
        flash[:message] = "Invalid login. Please try again."
        render :new
      end
  end

  def google_auth
    if @agency = Agency.find_by(email: auth['info']['email'])
      session[:user_id] = @agency.id
      redirect_to agencies_main_path(@agency)
    else
      @agency = Agency.new(name: auth['info']['name'], email: auth['info']['email'], password: SecureRandom.hex)
      if @agency.save
        session[:user_id] = @agency.id
        redirect_to agencies_main_path(@agency)
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
