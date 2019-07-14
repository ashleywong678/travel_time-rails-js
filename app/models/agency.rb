class Agency < ApplicationRecord
  has_secure_password
  has_many :tours
  has_many :customers, through: :tours
  validates :name, :email, presence: true
  validates :name, :email, uniqueness: true

  def self.create_from_google(auth)
    Agency.find_or_create_by(email: auth[:info][:email]) do |agency|
        agency.name = auth[:info][:name]
        agency.password = SecureRandom.hex
    end
  end

end
