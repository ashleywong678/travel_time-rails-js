class CustomersController < ApplicationController
  def index
    # binding.pry
    # if params[:tour_id] && logged_in?
    #   @customers = Customer.find_by(
    # else
      @customers = Customer.all
    # end
  end

  def new
    @customer = Customer.new
    @tour = Tour.find_by(id: params[:tour_id]) if params[:tour_id]
  end

  def create
    @customer = Customer.new(customer_params)
    @customer.tours << Tour.find_by(id: params[:tour_id]) if !@customer.tours.include?(params[:tour_id]) if params[:tour_id]
    if @customer.save
      redirect_to @customer
    else
      render :new
    end
  end

  def show
    @customer = Customer.find_by(id: params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :email, :phone_number, :city, :country, :language, :tour_id)
  end

end
