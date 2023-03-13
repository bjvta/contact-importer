# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  get 'profile/edit', to: 'profile#edit'
  patch 'profile/update', to: 'profile#update'
  get 'profile/show', to: 'profile#show'
end
