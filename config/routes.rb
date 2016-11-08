# frozen_string_literal: true
Rails.application.routes.draw do
  resources :verification_personals
  get 'verification/personal'

  get 'verification/business'

  get 'verification/banking'

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
