# frozen_string_literal: true
class VerificationController < ApplicationController
  before_action :authenticate_user!

  def personal
    @verification_personal = VerificationPersonal.new
    @verification_personal = current_user.verification_personal if current_user.verification_personal.present?
  end

  def business
    @verification_supporting_documents = VerificationPersonal.new
    @verification_supporting_documents = current_user.verification_personal if current_user.verification_personal.present?
  end

  def banking
    @verification_banking = VerificationPersonal.new
    @verification_banking = current_user.verification_personal if current_user.verification_personal.present?
    @bank_list = [
      ['Select a Bank', nil],
      ['Allied Bank Limited (ABL)', 'Allied Bank Limited (ABL)'],
      ['Al Baraka Bank', 'Al Baraka Bank'],
      ['Bank Alfalah', 'Bank Alfalah'],
      ['Askari Bank', 'Askari Bank'],
      ['Bank Al Habib', 'Bank Al Habib'],
      ['BankIslami Pakistan', 'BankIslami Pakistan'],
      ['Bank of Punjab (BOP)', 'Bank of Punjab (BOP)'],
      ['Burj Bank', 'Burj Bank'],
      ['Dubai Islamic Bank', 'Dubai Islamic Bank'],
      ['Faysal Bank', 'Faysal Bank'],
      ['First Women Bank', 'First Women Bank'],
      ['Habib Metropolitan Bank', 'Habib Metropolitan Bank'],
      ['Habib Bank Limited (HBL)', 'Habib Bank Limited (HBL)'],
      ['MCB Bank (formerly Muslim Commercial Bank)', 'MCB Bank (formerly Muslim Commercial Bank)'],
      ['Meezan Bank', 'Meezan Bank'],
      ['NIB Bank', 'NIB Bank'],
      ['Samba Bank', 'Samba Bank'],
      ['Standard Chartered Bank (SCB)', 'Standard Chartered Bank (SCB)'],
      ['Silk Bank', 'Silk Bank'],
      ['Sindh Bank', 'Sindh Bank'],
      ['Soneri Bank', 'Soneri Bank'],
      ['Summit Bank', 'Summit Bank'],
      ['Tameer Bank', 'Tameer Bank'],
      ['United Bank Limited (UBL)', 'United Bank Limited (UBL)'],
      ['Other', 'Other']
    ]
  end
end
