class CreateMarks < ActiveRecord::Migration
  def change
    create_table :marks do |t|
      t.integer :user_id
      t.integer :book_id
      t.integer :mark_type
      t.boolean :favorite, default: false

      t.timestamps null: false
    end
    add_index :marks, [:user_id, :book_id, :mark_type], unique: true
  end
end
