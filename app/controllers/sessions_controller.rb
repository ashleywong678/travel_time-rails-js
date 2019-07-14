class SessionsController < ApplicationController

  def welcome #root view page
  end
  
  def new #login view page
    @agencies = Agency.all
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
        @agencies = Agency.all
        render :new
      end
  end

  def google_auth
    # if @agency = Agency.find_by(email: auth['info']['email'])
    #   session[:user_id] = @agency.id
    #   redirect_to agencies_main_path(@agency)
    # else
    #   @agency = Agency.create(name: auth['info']['first_name'], email: auth['info']['email'], password: SecureRandom.hex)
    #   if @agency
    #     session[:user_id] = @agency.id
    #     redirect_to agencies_main_path(@agency)
    #   end
    # end
    @agency = Agency.create_from_google(auth)
    set_session
    if logged_in?
        flash[:message] = "Successfully authenticated via Google!"
        redirect_to agencies_main_path(@agency)
    else
        flash[:message] = "Something went wrong. Try again"
        redirect_to root_path
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
