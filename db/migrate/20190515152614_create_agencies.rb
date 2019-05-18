class CreateAgencies < ActiveRecord::Migration[5.2]
  def change
    create_table :agencies do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :country
      t.string :language
      t.string :phone_number
      t.string :password_digest
    end
  end
end
