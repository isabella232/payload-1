# frozen_string_literal: true
class VerificationController < ApplicationController
  before_action :authenticate_user!

  def personal
    @verification_personal = VerificationPersonal.new
  end

  def documents
    @supporting_documents = Document.new
  end

  def withdrawals
    @withdrawal_option = WithdrawalOption.new
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
      %w(Other Other)
    ]
  end
end
