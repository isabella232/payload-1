# frozen_string_literal: true
# ## Schema Information
#
# Table name: `verification_personals`
#
# ### Columns
#
# Name                     | Type               | Attributes
# ------------------------ | ------------------ | ---------------------------
# **`id`**                 | `integer`          | `not null, primary key`
# **`user_id`**            | `integer`          |
# **`name`**               | `string`           |
# **`dob`**                | `date`             |
# **`email_primary`**      | `string`           |
# **`phone_mobile`**       | `string`           |
# **`phone_secondary`**    | `string`           |
# **`address_current`**    | `string`           |
# **`address_permanent`**  | `string`           |
# **`id_cnic`**            | `string`           |
# **`convicted`**          | `boolean`          |
# **`terrorist`**          | `boolean`          |
# **`created_at`**         | `datetime`         | `not null`
# **`updated_at`**         | `datetime`         | `not null`
# **`gender`**             | `integer`          | `not null`
#
# ### Indexes
#
# * `index_verification_personals_on_user_id`:
#     * **`user_id`**
#
# ### Foreign Keys
#
# * `fk_rails_6fc5d91c4c`:
#     * **`user_id => users.id`**
#

class VerificationPersonal < ApplicationRecord
  belongs_to :user

  enum gender: %i(male female khansa)
end
