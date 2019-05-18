class Agency < ApplicationRecord
  has_secure_password
  has_many :tours

  # devise :omniauthable, :omniauth_providers => [:google_oauth2]

  def self.from_omniauth(auth)
   # Creates a new user only if it doesn't exist
    where(email: auth.info.email).first_or_initialize do |agency|
      agency.name = auth.info.name
    end
  end

end
