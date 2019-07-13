class CustomersController < ApplicationController
  before_action :require_login

  def index
    if params[:tour_id]   #if it's nested
      @customers = Tour.find_by(id: params[:tour_id]).customers
    else
      @customers = Customer.all
    end
    respond_to do |f|
      f.html
      f.json{render json: @customers}
    end
  end

  def new
    if params[:tour_id]   #if it's nested
      @tour = Tour.find_by(id: params[:tour_id])
      if @tour.agency == current_user
        @customer = @tour.customers.build   #need associated objects
        @tours = Tour.all
      else
        flash[:message] = "Sorry, your agency does not have the privileges to edit this tour"
        redirect_to @tour
      end
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
      if @customer.errors.any?    #if there's problems creating
        render :new     #show errors
      else    #if it's successful creating a customer
        if params[:customer][:tour_id]  #if the form is nested
          @tour = Tour.find_by(id: params[:customer][:tour_id])
          customer_tour = @tour.customer_tours.build(customer_id: @customer.id)    #creat a join table between @tour and @customer
          customer_tour.save
          @customer.save
        end
        redirect_to @customer   #then go to customer show page
      end
    end
  end

  def show
    set_customer
    respond_to do |f|
      f.html
      f.json{render json: @customer}
    end
  end

  def edit
    set_customer
    @tours  = Tour.all
  end

  def update
    set_customer
    @customer.update(customer_params)
    if @customer.errors.any?
      render :edit
    end
    redirect_to @customer
  end

  def destroy
    set_customer
    if @customer && logged_in?
      @customer.destroy
      redirect_to customers_path
    else
      redirect_to @customer
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :email, :phone_number, :city, :country, :language, :customer_tours, tour_ids:[])
  end

  def set_customer
    @customer = Customer.find_by(id: params[:id])
  end

end
