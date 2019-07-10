class TourSerializer < ActiveModel::Serializer
  attributes :id, :title, :country, :date, :length, :price, :description

  belongs_to :agency
  has_many :customer_tours
  
end
