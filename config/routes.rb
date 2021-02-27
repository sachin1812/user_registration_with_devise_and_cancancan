# frozen_string_literal: true

Rails.application.routes.draw do

  devise_for :users
  scope '/admin' do
    resources :users
  end

  resources :roles
  resources :users

  root to: 'home#index'
end
