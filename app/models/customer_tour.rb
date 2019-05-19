class CustomerTour < ApplicationRecord
  belongs_to :tour
  belongs_to :customer
  
end