class ToursController < ApplicationController
  before_action :require_login, except: [:index]
  
  def index
    if params[:agency_id] && current_user.id == params[:agency_id].to_i
      @tours = current_user.tours
    else
      @tours = Tour.all
    end
  end

  def new
    if logged_in?
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
    @tour = Tour.find_by(id: params[:id])
    @agency = @tour.agency
    if logged_in? && @agency == current_user
      render :edit
    else
      redirect_to root_path
    end
  end

  def update
    @tour = Tour.find_by(id: params[:id])
    @tour.update(tour_params)
    if @tour.errors.any?
      render :edit
    else
      redirect_to @tour
    end
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
