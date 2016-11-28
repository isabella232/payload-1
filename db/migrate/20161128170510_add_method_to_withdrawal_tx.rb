class AddMethodToWithdrawalTx < ActiveRecord::Migration[5.0]
  def change
    add_column :withdrawal_txes, :method, :integer, null: false
  end
end
