# frozen_string_literal: true
class UpdateBtcTxStatusJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    BtcTx.where(confirmation_status: 'pending').each(&:check_status)
  end
end
