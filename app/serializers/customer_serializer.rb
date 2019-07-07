class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :phone_number, :city, :country, :language

  has_many :customer_tours
end
