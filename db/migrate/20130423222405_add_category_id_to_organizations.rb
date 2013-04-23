class AddCategoryIdToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :category_id, :integer
    add_index  :organizations, :category_id
    add_column :organizations, :display_location, :string
  end
end
