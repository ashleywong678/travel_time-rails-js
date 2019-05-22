class CustomerTour < ApplicationRecord
  belongs_to :tour
  belongs_to :customer
  # validates :tour_id, :customer_id, presenced: true
  
end