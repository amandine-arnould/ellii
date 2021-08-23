class ChangeColumnNameFromMoods < ActiveRecord::Migration[6.0]
  def change
    rename_column :moods, :state, :score
  end
end
