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
