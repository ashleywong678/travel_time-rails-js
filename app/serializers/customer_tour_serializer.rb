class CustomerTourSerializer < ActiveModel::Serializer
  attributes :id, :customer_id, :tour_id

  belongs_to :customer
  belongs_to :tour
end
