class CreateFeedbacktable < ActiveRecord::Migration
  def change
    create_table :spree_feedbacks do |t|
      t.references :order
      t.string :status
      t.timestamps
    end
  end
end
