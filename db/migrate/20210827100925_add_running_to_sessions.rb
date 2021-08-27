class AddRunningToSessions < ActiveRecord::Migration[6.0]
  def change
    add_column :sessions, :running, :boolean
  end
end
