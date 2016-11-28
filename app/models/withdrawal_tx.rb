# ## Schema Information
#
# Table name: `withdrawal_txes`
#
# ### Columns
#
# Name                       | Type               | Attributes
# -------------------------- | ------------------ | ---------------------------
# **`id`**                   | `integer`          | `not null, primary key`
# **`amount`**               | `decimal(, )`      | `not null`
# **`fee_amount`**           | `decimal(, )`      | `not null`
# **`urdubit_ref`**          | `string`           |
# **`confirmation_status`**  | `integer`          |
# **`account_id`**           | `integer`          |
# **`created_at`**           | `datetime`         | `not null`
# **`updated_at`**           | `datetime`         | `not null`
#
# ### Indexes
#
# * `index_withdrawal_txes_on_account_id`:
#     * **`account_id`**
#
# ### Foreign Keys
#
# * `fk_rails_b4bbf81727`:
#     * **`account_id => accounts.id`**
#

class WithdrawalTx < ApplicationRecord
  belongs_to :account
end
