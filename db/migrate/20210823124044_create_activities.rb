class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.string :title
      t.date :date
      t.time :time
      t.text :description
      t.integer :duration
      t.boolean :remote
      t.references :user, null: false, foreign_key: true
      t.integer :min_participants
      t.integer :max_participants
      t.integer :number_of_participants
      t.boolean :mind
      t.string :address

      t.timestamps
    end
  end
end
