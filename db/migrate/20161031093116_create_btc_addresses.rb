class CreateBtcAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :btc_addresses do |t|
      t.references :user, foreign_key: true
      t.string :address

      t.timestamps
    end
  end
end
