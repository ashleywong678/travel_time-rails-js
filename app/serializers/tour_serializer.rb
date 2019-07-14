class TourSerializer < ActiveModel::Serializer
  attributes :id, :title, :country, :date, :length, :price, :description, :agency_id

  belongs_to :agency
  has_many :customer_tours, serializer: CustomerTourSerializer
  
end
