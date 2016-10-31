# ## Schema Information
#
# Table name: `accounts`
#
# ### Columns
#
# Name              | Type               | Attributes
# ----------------- | ------------------ | ---------------------------
# **`id`**          | `integer`          | `not null, primary key`
# **`limit`**       | `decimal(, )`      | `default(0.0), not null`
# **`user_id`**     | `integer`          |
# **`created_at`**  | `datetime`         | `not null`
# **`updated_at`**  | `datetime`         | `not null`
#
# ### Indexes
#
# * `index_accounts_on_user_id`:
#     * **`user_id`**
#
# ### Foreign Keys
#
# * `fk_rails_b1e30bebc8`:
#     * **`user_id => users.id`**
#

class Account < ApplicationRecord
  belongs_to :user
end
