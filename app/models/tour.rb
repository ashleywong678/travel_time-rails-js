class Tour < ApplicationRecord
  belongs_to :agency
  has_many :customer_tours
  has_many :customers, through: :customer_tours
  validates :todays_date, confirmation: true
  validates :title, :country, :length, :price, :agency_id, presence: true
  validates :length, :price, numericality: true
  validates :length, length: { minimum: 1 }
  validates :length, :price, numericality: { only_integer: true }
  validates :price, length: { minimum: 1 }
  validates :price, numericality: { greater_than: 0 }
  scope :best, -> {joins(:customer_tours).group("tours.id").order('count_id desc').count('id')}
  
  def todays_date #check if :date is after current date
    if date == nil
      errors[:date] << "cannot be blank"
    elsif date.past? || date == Date.today
      errors[:date] << "must be after today"
    end
  end


end
