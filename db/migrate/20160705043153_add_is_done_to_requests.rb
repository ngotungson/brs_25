class AddIsDoneToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :is_done, :boolean, default: false
  end
end
