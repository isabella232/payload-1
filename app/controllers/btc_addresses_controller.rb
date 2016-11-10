# frozen_string_literal: true
class BtcAddressesController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.btc_addresses << BtcAddress.new
    flash[:notice] = 'We created a new address for you!'
    redirect_to dashboard_path
  end
end
