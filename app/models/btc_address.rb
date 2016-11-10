# frozen_string_literal: true
# ## Schema Information
#
# Table name: `btc_addresses`
#
# ### Columns
#
# Name              | Type               | Attributes
# ----------------- | ------------------ | ---------------------------
# **`id`**          | `integer`          | `not null, primary key`
# **`user_id`**     | `integer`          |
# **`address`**     | `string`           | `not null`
# **`created_at`**  | `datetime`         | `not null`
# **`updated_at`**  | `datetime`         | `not null`
#
# ### Indexes
#
# * `index_btc_addresses_on_user_id`:
#     * **`user_id`**
#
# ### Foreign Keys
#
# * `fk_rails_776dcc5b39`:
#     * **`user_id => users.id`**
#

class BtcAddress < ApplicationRecord
  before_validation :create_btc_address

  belongs_to :user
  has_many :btc_txes

  validates :user, presence: true
  validates :address, presence: true

  private

  def create_btc_address
    require 'coinbase/wallet'

    coinbase = Coinbase::Wallet::Client.new(
      api_key:    Rails.application.secrets.coinbase_api_key,
      api_secret: Rails.application.secrets.coinbase_api_secret
    )

    self.address ||= coinbase.create_address(
      Rails.application.secrets.coinbase_account_id,
      name: "#{user_id}-#{SecureRandom.base58}"
    ).address
  end
end
