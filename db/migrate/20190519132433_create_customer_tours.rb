class CreateCustomerTours < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_tours do |t|
      t.integer :tour_id
      t.integer :customer_id
      t.boolean :canceled, :default => false
    end
  end
end
