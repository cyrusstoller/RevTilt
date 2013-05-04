class CreateCacheReviewStats < ActiveRecord::Migration
  def change
    create_table :cache_review_stats do |t|
      t.integer :organization_id
      t.integer :num_reviews, :default => 0
      t.float :avg_review, :default => 0.0
      t.integer :condition_id

      t.timestamps
    end
    add_index :cache_review_stats, :organization_id
    add_index :cache_review_stats, :num_reviews
    add_index :cache_review_stats, :avg_review
    add_index :cache_review_stats, :condition_id
  end
end
