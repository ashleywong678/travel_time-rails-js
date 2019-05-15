class AgenciesController < ApplicationController
    
  def new #signup
    @agency = Agency.new
  end
  
  def create #signup
    @agency = Agency.create(agency_params)
    if @agency
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
  end

  def update
  end

  private

  def agency_params
    params.require(:agency).permit(:name, :password, :address, :phone_number, :country, :language)
  end

end

# "agency"=>{
#   "name"=>"World Travel", 
#   "address"=>"123 somewhere street", 
#   "phone_number"=>"1234567890", 
#   "country"=>"US", 
#   "language"=>"English"}