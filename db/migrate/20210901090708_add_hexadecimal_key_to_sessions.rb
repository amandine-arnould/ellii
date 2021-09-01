class AddHexadecimalKeyToSessions < ActiveRecord::Migration[6.0]
  def change
    add_column :sessions, :hex_key, :string
  end
end
