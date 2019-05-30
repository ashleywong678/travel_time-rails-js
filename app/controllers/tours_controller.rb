class ToursController < ApplicationController
  before_action :require_login, except: [:index, :show]
  
  def index
    if params[:agency_id] && current_user.id == params[:agency_id].to_i
      @tours = current_user.tours
    else
      @tours = Tour.all
    end
  end

  def new
    @agency = Agency.find_by(id: current_user.id)
    @tour = @agency.tours.build
  end

  def create
    @agency = Agency.find_by(id: params[:agency_id])
    if @agency == current_user
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
    set_tour
  end

  def edit
    set_tour
    @agency = @tour.agency
    if @agency == current_user
      render :edit
    else
      flash[:message] = "Sorry, your agency does not have edit privileges."
      redirect_to @tour
    end
  end

  def update
    set_tour
    if @tour.agency == current_user
      @tour.update(tour_params)
      if @tour.errors.any?
        render :edit
      else
        redirect_to @tour
      end
    else
      flash[:message] = "Sorry, your agency does not have edit privileges."
      redirect_to @tour
    end
  end

  def destroy
    set_tour
    if @tour && current_user == @tour.agency
      @tour.destroy
      redirect_to tours_path
    else
      flash[:message] = "Sorry, cannot delete a tour that doesn't belong to your agency.'"
      redirect_to tours_path
    end
  end

  private

  def tour_params
    params.require(:tour).permit(:title, :country, :date, :length, :price, :description, :agency_id)
  end

  def set_tour
    @tour = Tour.find_by(id: params[:id])
  end

end
