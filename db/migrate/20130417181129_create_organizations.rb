class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :url
      t.string :url_type
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
    
    add_index :organizations, :latitude
    add_index :organizations, :longitude
    add_index :organizations, :name
  end
end
