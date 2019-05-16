class AgenciesController < ApplicationController
    
  def new #signup
    @agency = Agency.new
  end
  
  def create #signup
    @agency = Agency.new(agency_params)
    if @agency.save
      session[:user_id] = @agency.id
      redirect_to agencies_main_path(@agency)
    else
      render :new
    end
  end

  def main #agency's main page
    @agency = Agency.find_by(id: params[:id])
  end

  def show #agency's profile page
    if logged_in?
      @agency = Agency.find_by(id: params[:id])
    else
      redirect_to login_path
    end
  end

  def edit
    @agency = Agency.find_by(id: params[:id])
  end

  def update
    @agency = Agency.find_by(id: params[:id])
    if logged_in? && @agency == current_user
      @agency.update(agency_params)
      redirect_to @agency
    else
      redirect_to root_path
    end
  end

  def destroy
    @agency = Agency.find_by(id: params[:id])
    if @agency == current_user
      @article.destroy
    else
      redirect_to root_path
    end
  end

  private

  def agency_params
    params.require(:agency).permit(:name, :password, :address, :phone_number, :country, :language)
  end

end
