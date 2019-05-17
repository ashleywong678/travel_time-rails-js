class ToursController < ApplicationController
  def index
    #first - if check if url is nested (if there's params[agency_id])
    if logged_in?
      @tours = current_user.tours
    else
      @tours = Tour.all
    end
  end

  def new
    if current_user && logged_in?
      @agency = Agency.find_by(id: current_user.id)
      @tour = @agency.tours.build
    else
      redirect_to root_path
    end
  end

  def create
    @agency = Agency.find_by(id: params[:agency_id])
    if logged_in? && @agency == current_user
      @tour = @agency.tours.build(tour_params)
      if @tour.save
        redirect_to @tour
      else
        render :new
      end
    else
      redirect_to root_path
    end
  end

  def show
    @tour = Tour.find_by(id: params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
    @tour = Tour.find_by(id: params[:id])
    if @tour && logged_in? && current_user == @tour.agency
      @tour.destroy
      redirect_to tours_path
    else
      redirect_to tours_path
    end
  end

  private

  def tour_params
    params.require(:tour).permit(:title, :country, :date, :length, :price, :description, :agency_id)
  end

end
