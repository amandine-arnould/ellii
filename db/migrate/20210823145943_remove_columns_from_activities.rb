class RemoveColumnsFromActivities < ActiveRecord::Migration[6.0]
  def change
    remove_column :activities, :date
    remove_column :activities, :time
    remove_column :activities, :number_of_participants
  end
end
