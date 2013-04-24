class AddDisplayLocationToOrganization < ActiveRecord::Migration
  def change
    add_column :organizations, :display_location, :string
  end
end
