class CreateBtcTxes < ActiveRecord::Migration[5.0]
  def change
    create_table :btc_txes do |t|
      t.references :btc_address, foreign_key: true
      t.decimal :amount, precision: 16, scale: 8
      t.integer :confirmation_status
      t.string :coinbase_id
      t.decimal :native_amount
      t.integer :native_currency

      t.timestamps
    end
  end
end
