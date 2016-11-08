# frozen_string_literal: true
class VerificationPersonalsController < ApplicationController
  before_action :authenticate_user!

  def create
    @verification_personal = VerificationPersonal.new(personal_verification_params)
    @verification_personal.user = current_user

    if @verification_personal.save
      redirect_to verification_business_path, notice: 'Personal information submitted.'
    else
      redirect_to verification_personal_path, notice: 'Something went wrong'
    end
  end

  protected

  def personal_verification_params
    byebug
    params
      .fetch(:verification_personal)
      .permit(
        :name,
        :dob,
        :male,
        :email_primary,
        :phone_mobile,
        :phone_secondary,
        :address_current,
        :address_permanent,
        :id_cnic
      )
  end
end
