# frozen_string_literal: true
# The private user area
class DashboardController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = current_user
    @withdrawal_tx = WithdrawalTx.new
  end
end
