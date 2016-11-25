class WithdrawalOptionsController < ApplicationController
  def create
    @withdrawal_option = WithdrawalOption.new(withdrawal_option_params)
    @withdrawal_option.user = current_user

    if @withdrawal_option.save
      redirect_to dashboard_path, notice: 'Withdrawal information submitted for review.'
    else
      redirect_to dashboard_path, notice: 'Something went wrong'
    end
  end

  protected

  def withdrawal_option_params
    params
      .fetch(:withdrawal_option)
      .permit(
        :option_type,
        :bank_name,
        :account_title,
        :account_number
      )
  end
end
