class CreateTours < ActiveRecord::Migration[5.2]
  def change
    create_table :tours do |t|
      t.string :country
      t.date :date
      t.integer :length
      t.integer :price
      t.integer :agency_id
    end
  end
end
