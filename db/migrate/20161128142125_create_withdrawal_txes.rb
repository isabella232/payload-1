class CreateWithdrawalTxes < ActiveRecord::Migration[5.0]
  def change
    create_table :withdrawal_txes do |t|
      t.decimal :amount, null: false
      t.decimal :fee_amount, null: false
      t.string :urdubit_ref
      t.integer :confirmation_status
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
