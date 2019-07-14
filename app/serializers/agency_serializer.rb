class AgencySerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :address, :country, :language, :phone_number

  has_many :tours, serializer: TourSerializer
end
