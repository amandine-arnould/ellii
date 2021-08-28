class RemoveColumnsFromSessions < ActiveRecord::Migration[6.0]
  def change
    remove_column :sessions, :room_url
    remove_column :sessions, :running
  end
end
