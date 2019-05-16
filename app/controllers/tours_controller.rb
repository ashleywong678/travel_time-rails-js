class ToursController < ApplicationController
  def index
    @tours = Tour.all
  end

  def new
    if current_user && logged_in?
      agency = Agency.find_by(id: current_user.id)
      @tour = agency.tours.build
    else
      redirect_to root_path
    end
  end

  def create
    binding.pry
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
