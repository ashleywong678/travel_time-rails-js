class Customer < ApplicationRecord
  has_many :customer_tours
  has_many :tours, through: :customer_tours
  has_many :agencies, through: :tours
  
end
