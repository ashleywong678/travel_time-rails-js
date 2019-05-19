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
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
