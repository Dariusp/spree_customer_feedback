class AddColumToFeedback < ActiveRecord::Migration
  def change
    add_column :spree_feedbacks, :hash_url, :string
    add_index :spree_feedbacks, :hash_url
  end
end
