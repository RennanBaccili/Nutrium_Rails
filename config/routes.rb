# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.

  root 'home#index'
  resources :users

  get '/professionals', to: 'professionals#index'

  #teste
  route :sign do
    create 'sign', as: 'sign'
  end
  resources :pages, only: [:index] do
    get 'open_modal', on: :collection
    post 'close_modal', on: :collection
  end

end
