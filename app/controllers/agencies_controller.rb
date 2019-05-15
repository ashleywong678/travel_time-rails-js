class AgenciesController < ApplicationController
  
  def new
    @agency = Agency.new
  end
  
  def create
    @agency = Agency.create(agency_params)
    if @agency
      session[:user_id] = @agency.id
      redirect_to @agency
    else
      render :new
    end
  end

  def show
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