class AddHomepageUrlToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :homepage_url, :string
  end
end
