class CustomersController < ApplicationController

  def index
    if params[:tour_id] && logged_in?
      @customers = Tour.find_by(id: params[:tour_id]).customers
    else
      @customers = Customer.all
    end
  end

  def new
    if params[:tour_id]
      @tour = Tour.find_by(id: params[:tour_id]) if params[:tour_id]
      @customer = @tour.customers.build
    else
      @customer = Customer.new
    end
  end

  def create
    if params[:tour_id]
    @tour = Tour.find_by(id: params[:tour_id])
    @customer = Customer.create(customer_params)
    if @customer
        ct = @tour.customer_tours.build(customer_id: @customer.id, notes: params[:notes])
        ct.save
        redirect_to @customer
      end
    elsif
      @customer = Customer.create(customer_params)
      if @customer
        redirect_to @customer
      end
    else
      render :new
    end
  end

  def show
    @customer = Customer.find_by(id: params[:id])
    @notes = @customer.customer_tours
  end

  def edit
    @customer = Customer.find_by(id: params[:id])
    @tours  = Tour.all
  end

  def update
    @customer = Customer.find_by(id: params[:id])
    @customer.update(customer_params)
    if tours = params[:customer][:tour_ids] 
      tours.each do |tour|
        t = Tour.find_by(id: tour.to_i)
        if t
          # binding.pry
          if !@customer.tours.include?(t)
            ct = @customer.customer_tours.build(notes: params[:notes], tour_id: t.id) 
            #notes not being added, need to fix
            ct.save
          end
        end
      end
    end
    redirect_to @customer
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
