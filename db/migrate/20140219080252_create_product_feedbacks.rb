class CreateProductFeedbacks < ActiveRecord::Migration
  def change
    create_table :spree_product_feedbacks do |t|
      t.integer :product_id
      t.integer :user_id
      t.integer :order_id
      t.string :feedback_type
      t.text :review
      t.float :rating
      t.boolean :published
      t.timestamps
    end
  end
end
