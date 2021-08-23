class AddColumnToActivities < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :admin_validation, :boolean, default: false
  end
end
