class ChangeMaleToGenderInVerificationPersonal < ActiveRecord::Migration[5.0]
  def change
    remove_column :verification_personals, :male
    add_column :verification_personals, :gender, :integer, null: false
  end
end
