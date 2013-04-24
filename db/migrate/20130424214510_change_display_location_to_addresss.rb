class ChangeDisplayLocationToAddresss < ActiveRecord::Migration
  def change
    rename_column :organizations, :display_location, :address
  end
end
