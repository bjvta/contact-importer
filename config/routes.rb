# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users
  get 'upload/index'
  get 'upload/:id', to: 'upload#show', as: :upload_show
  get 'upload-file/import', to: 'upload#import'
  post 'upload-file/import', to: 'upload#import'
  get 'home/index'
  get 'profile/edit', to: 'profile#edit'
  patch 'profile/update', to: 'profile#update'
  get 'profile/show', to: 'profile#show'
  resources :contacts, only: [:index]
end
