class Agency < ApplicationRecord
  has_secure_password
  has_many :tours
  has_many :customers, through: :tours
  validates :name, :email, presence: true
  validates :name, :email, uniqueness: true
  # validates :phone_number, length: { is: 10 }

  def self.from_omniauth(auth)
   # Creates a new user only if it doesn't exist
    where(email: auth.info.email).first_or_initialize do |agency|
      agency.name = auth.info.name
    end
  end

end
