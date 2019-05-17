class Tour < ApplicationRecord
  belongs_to :agency
  scope :my_tours, -> (agency) { where("agency_id = ?", agency.id) }


  def self.most_popular #returns list of ordered tours by most customer signup

  end

end
