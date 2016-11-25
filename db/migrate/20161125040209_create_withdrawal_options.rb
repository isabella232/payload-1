class CreateWithdrawalOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :withdrawal_options do |t|
      t.references :user, foreign_key: true, null: false
      t.integer :option_type, null: false
      t.string :bank_name
      t.string :account_title
      t.string :account_number

      t.timestamps
    end
  end
end
