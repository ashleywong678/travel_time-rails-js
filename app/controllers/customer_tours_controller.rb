class CustomerToursController < ApplicationController

  def update
    binding.pry
    customer_tour = CustomerTour.find_by(id: params[:id])
    customer_tour.canceled = true
    customer_tour.save
    @customer = customer_tour.customer
    redirect_to @customer
  end

end
