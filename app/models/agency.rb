class Agency < ApplicationRecord
  has_secure_password
  has_many :tours

end
