# frozen_string_literal: true
class VerificationController < ApplicationController
  before_action :authenticate_user!

  def personal
    @verification_personal = VerificationPersonal.new
    @verification_personal = current_user.verification_personal if current_user.verification_personal.present?
  end

  def business
  end

  def banking
  end
end
