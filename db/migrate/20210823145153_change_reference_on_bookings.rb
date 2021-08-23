class ChangeReferenceOnBookings < ActiveRecord::Migration[6.0]
  def change
    remove_reference :bookings, :activity, index: true, foreign_key: true
  end
end
