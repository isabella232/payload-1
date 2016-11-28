class WithdrawalOptionsController < ApplicationController
  before_action :authenticate_user!

  def create
    @withdrawal_option = WithdrawalOption.new(withdrawal_option_params)
    @withdrawal_option.user = current_user
    @withdrawal_option.bank_name = bank_name_override_from_params unless bank_name_override_from_params.empty?

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

  def bank_name_override_from_params
    params
      .fetch(:bank_name_override)
      .permit(:bank_name)[:bank_name]
  end
end
