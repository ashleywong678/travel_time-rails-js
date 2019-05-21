class Customer < ApplicationRecord
  has_many :customer_tours
  has_many :tours, through: :customer_tours
  has_many :agencies, through: :tours
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
  validates :phone_number, length: { is: 10 }

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def formal_name
    "#{self.last_name}, #{self.first_name}"
  end
  
end
