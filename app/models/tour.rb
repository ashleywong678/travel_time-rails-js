class Tour < ApplicationRecord
  belongs_to :agency
  has_many :customer_tours
  has_many :customers, through: :customer_tours


  def self.most_popular #returns list of ordered tours by most customer signup

  end

end
