# frozen_string_literal: true
# ## Schema Information
#
# Table name: `btc_txes`
#
# ### Columns
#
# Name                       | Type               | Attributes
# -------------------------- | ------------------ | ---------------------------
# **`id`**                   | `integer`          | `not null, primary key`
# **`btc_address_id`**       | `integer`          |
# **`amount`**               | `decimal(16, 8)`   |
# **`confirmation_status`**  | `integer`          |
# **`coinbase_id`**          | `string`           |
# **`native_amount`**        | `decimal(, )`      |
# **`native_currency`**      | `integer`          |
# **`created_at`**           | `datetime`         | `not null`
# **`updated_at`**           | `datetime`         | `not null`
# **`trade_id`**             | `string`           |
#
# ### Indexes
#
# * `index_btc_txes_on_btc_address_id`:
#     * **`btc_address_id`**
#
# ### Foreign Keys
#
# * `fk_rails_f31e8e88ea`:
#     * **`btc_address_id => btc_addresses.id`**
#

class BtcTx < ApplicationRecord
  belongs_to :btc_address
  before_validation :set_defaults

  # the status of the transaction
  # pending: not confirmed on the blockchain yet
  # confirmed: Confirmed on the blockchain but not yet traded
  # processing: Confirmed and traded, but not yet paid out
  # completed: paid out
  enum confirmation_status: %i(pending trading withdrawing completed)

  # what currency was this btc exchanged for?
  enum native_currency: %i(pkr usd eur)

  validates :amount, presence: true, numericality: true
  validates :coinbase_id, presence: true
  validates :native_currency, presence: true
  validates :confirmation_status, presence: true

  def check_status
    require 'coinbase/wallet'

    coinbase = Coinbase::Wallet::Client.new(
      api_key:    Rails.application.secrets.coinbase_api_key,
      api_secret: Rails.application.secrets.coinbase_api_secret
    )
    tx = coinbase.transaction(
      Rails.application.secrets.coinbase_account_id,
      coinbase_id
    )

    if confirmation_status == 'pending' && tx.status == 'completed'
      self.confirmation_status = 'trading'
      send_order(amount * 1e8)
      return save
    end
    self
  end

  private

  def set_defaults
    self.native_currency ||= 'pkr'
    self.confirmation_status ||= 'pending'
  end

  def send_order(amount_in_satoshi)
    HTTParty.post(
      'https://urdubit.payload.pk',
      query:   {
        secret: Rails.application.secrets.urdubit_secret
      },
      body:    { amount: amount_in_satoshi }.to_json,
      headers: { 'Content-Type' => 'application/json' }
    )
  end
end
