class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :content
      t.integer :user_id
      t.integer :condition_id
      t.integer :organization_id

      t.timestamps
    end
    
    add_index :reviews, :user_id
    add_index :reviews, :condition_id
    add_index :reviews, :organization_id
    add_index :reviews, :rating
  end
end
