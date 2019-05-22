class CustomersController < ApplicationController

  def index
    if params[:tour_id] && logged_in?
      @customers = Tour.find_by(id: params[:tour_id]).customers
    else
      @customers = Customer.all
    end
  end

  def new
    if params[:tour_id]   #if it's nested
      @tour = Tour.find_by(id: params[:tour_id])
      @customer = @tour.customers.build   #need associated objects
      @tours = Tour.all
    else    #if it's not nested
      @customer = Customer.new
      @tours = Tour.all
    end
  end

  def create
    @customer = Customer.find_by(customer_params) #if customer already exists
    if @customer
      flash[:message] = "Customer already exists"
      redirect_to customers_path        #send to customer index

    elsif !@customer    #if customer doesn't already exist
      @customer = Customer.create(customer_params)   #create customer
      if params[:customer][:tour_ids]  #if the form is nested
        @tour = Tour.find_by(id: params[:customer][:tour_id])
        customer_tour = @tour.customer_tours.build(customer_id: @customer.id)    #creat a join table between @tour and @customer
        customer_tour.save    #save b/c build doesn't persist
      end
      redirect_to @customer   #then go to customer show page

    else    #if everythign fails...
      render :new
    end
  end

  def show
    @customer = Customer.find_by(id: params[:id])
  end

  def edit
    @customer = Customer.find_by(id: params[:id])
    @tours  = Tour.all
  end

  def update
    binding.pry
    @customer = Customer.find_by(id: params[:id])
    @customer.update(customer_params)
    if @customer.errors.any?
      render :edit
      redirect_to @customer
    end
  end

  def destroy
    @customer = Customer.find_by(id: params[:id])
    if @customer && logged_in?
      @customer.destroy
      redirect_to customers_path
    else
      redirect_to @customer
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :email, :phone_number, :city, :country, :language, :tour_ids, :customer_tours)
  end

end
