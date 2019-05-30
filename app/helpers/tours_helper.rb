module ToursHelper

  def active_tours_count(tour)
    tour.customer_tours.active.count
  end

end
