class CreateSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :sessions do |t|
      t.datetime :start_at
      t.references :activity, null: false, foreign_key: true
      t.timestamps
    end
  end
end
