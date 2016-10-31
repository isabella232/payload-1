class AddNotNullToBtcAddresses < ActiveRecord::Migration[5.0]
  def change
    change_column :btc_addresses, :address, :string, null: false
  end
end
