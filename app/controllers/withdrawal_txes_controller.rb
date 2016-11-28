class WithdrawalTxesController < ApplicationController
  before_action :authenticate_user!
  def create
    withdrawal = WithdrawalTx.new
    withdrawal.amount = current_user.account.balance
    withdrawal.account = current_user.account
    withdrawal.fee_amount = current_user.withdrawal_option.option_type == 'bank_account' ? (200) : (150 + withdrawal_tx.amount * 1 / 200)
    if withdrawal.save
      redirect_to dashboard_path, notice: 'Withdrawal pending'
    else
      redirect_to dashboard_path, notice: 'Something went wrong, please contact support'
    end
  end
end
