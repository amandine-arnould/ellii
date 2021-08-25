class AddRoomUrlToSessions < ActiveRecord::Migration[6.0]
  def change
    add_column :sessions, :room_url, :string
  end
end
