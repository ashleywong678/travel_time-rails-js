class Customer < ApplicationRecord
  has_many :customer_tours
  has_many :tours, through: :customer_tours
  has_many :agencies, through: :tours

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def formal_name
    "#{self.last_name}, #{self.first_name}"
  end
  
end
