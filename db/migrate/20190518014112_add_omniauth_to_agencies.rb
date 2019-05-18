class AddOmniauthToAgencies < ActiveRecord::Migration[5.2]
  def change
    add_column :agencies, :uid, :string
    add_column :agencies, :google_token, :string
    add_column :agencies, :google_refresh_token, :string
  end
end
