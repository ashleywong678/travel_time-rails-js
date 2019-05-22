class Tour < ApplicationRecord
  belongs_to :agency
  has_many :customer_tours
  has_many :customers, through: :customer_tours
  validates :title, :country, :date, :length, :price, :agency_id, presence: true
  validates :length, :price, numericality: true
  validates :length, length: { minimum: 1 }
  validates :length, :price, numericality: { only_integer: true }
  validates :price, length: { minimum: 1 }
  validates :price, numericality: { greater_than: 0 }
  validates :todays_date, confirmation: true

  def todays_date #check if :date is after current date
    if date.past? || date.today?
      errors[:date] << "date must be in the future"
    end
  end

  def self.most_popular #returns list of ordered tours by most customer signup

  end

end


# validate :expiration_date_cannot_be_in_the_past,
#     :discount_cannot_be_greater_than_total_value
 
#   def expiration_date_cannot_be_in_the_past
#     if expiration_date.present? && expiration_date < Date.today
#       errors.add(:expiration_date, "can't be in the past")
#     end
  # end