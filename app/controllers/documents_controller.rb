# frozen_string_literal: true
class DocumentsController < ApplicationController
  def create
    @documents = Document.new(document_params)

    if @documents.save
      redirect_to verification_withdrawals_path, notice: 'Verification documents submitted.'
    else
      redirect_to verification_documents_path, notice: 'Something went wrong'
    end
  end

  private

  # Use strong_parameters for attribute whitelisting
  # Be sure to update your create() and update() controller methods.

  def document_params
    params
      .require(:document)
      .permit(
        :cnic_front,
        :cnic_back,
        :cnic_selfie,
        :proof_of_residence
      )
  end
end
