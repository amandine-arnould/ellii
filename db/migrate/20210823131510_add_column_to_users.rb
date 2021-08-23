class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :status, :string
    add_column :users, :phone_number, :string
    add_column :users, :address, :string
    add_column :users, :avatar, :string
  end
end
