class CreateLikeActivities < ActiveRecord::Migration
  def change
    create_table :like_activities do |t|
      t.integer :user_id
      t.integer :activity_id

      t.timestamps null: false
    end
    add_index :like_activities, [:user_id, :activity_id], unique: true
  end
end
