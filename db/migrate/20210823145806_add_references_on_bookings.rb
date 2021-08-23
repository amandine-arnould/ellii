class AddReferencesOnBookings < ActiveRecord::Migration[6.0]
  def change
    add_reference :bookings, :session, index: true, foreign_key: true
  end
end
