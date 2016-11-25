class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.references :user, foreign_key: true
      t.timestamps
    end
    add_attachment :documents, :cnic_front
    add_attachment :documents, :cnic_back
    add_attachment :documents, :cnic_selfie
    add_attachment :documents, :proof_of_residence
  end
end
