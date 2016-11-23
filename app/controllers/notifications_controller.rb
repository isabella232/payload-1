# frozen_string_literal: true
class NotificationsController < ApplicationController
  # generally dangerious but this controller holds webhooks
  skip_before_action :verify_authenticity_token, only: [:coinbase, :mover]

  def coinbase
    # If the secret is incorrect, drop it like it's hot
    unless params[:secret] == Rails.application.secrets.coinbase_webhook_secret
      return render json: { success: false, message: 'Invalid secret' }
    end
    # If the secret's good, just keep going
    address = params['data']['address']
    amount = params['additional_data']['amount']['amount']
    coinbase_id = params['additional_data']['transaction']['id']

    btc_address = BtcAddress.find_by(address: address)
    btc_address.btc_txes << BtcTx.new(amount: amount, coinbase_id: coinbase_id)
    render json: { success: true, message: 'Transaction noted' }
  end

  def mover
    unless params[:secret] == Rails.application.secrets.mover_webhook_secret
      logger.info('Invalid secret for mover recieved', params[:secret])
      return render json: { success: false, message: 'Invalid secret' }
    end
    # If the secret's good, just keep going
    UpdateBtcTxStatusJob.perform_now
  end
end
