class CustomerTour < ApplicationRecord
  belongs_to :tour
  belongs_to :customer
  scope :active, -> { where(canceled: 'false') }
  
  def self.find_join(customer, tour)
    self.find_by(customer_id: customer.id, tour_id: tour.id)
  end

end