class AddSessionUrlToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :url_session, :string
  end
end
