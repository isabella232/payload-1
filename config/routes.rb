# frozen_string_literal: true
Rails.application.routes.draw do
  resources :withdrawal_txes
  resources :documents
  resources :withdrawal_options
  # webhooks
  post 'notifications/coinbase'
  post 'notifications/mover'
  post 'notifications/urdubit'

  resources :verification_personals
  get 'verification/personal'
  get 'verification/documents'
  get 'verification/withdrawals'

  resources :accounts
  resources :btc_addresses
  get 'dashboard' => 'dashboard#show'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    unlocks: 'users/unlocks',
    confirmations: 'users/confirmations'
  }
  root 'public_pages#home'
end
