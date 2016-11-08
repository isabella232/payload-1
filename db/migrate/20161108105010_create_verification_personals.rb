class CreateVerificationPersonals < ActiveRecord::Migration[5.0]
  def change
    create_table :verification_personals do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.date :dob
      t.boolean :male
      t.string :email_primary
      t.string :phone_mobile
      t.string :phone_secondary
      t.string :address_current
      t.string :address_permanent
      t.string :id_cnic
      t.boolean :convicted
      t.boolean :terrorist

      t.timestamps
    end
  end
end
