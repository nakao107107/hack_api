# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'googles/search' => 'googles#search'
  get 'googles/search_restaurant' => 'googles#search_restaurant'

  resources :courses, only: [:create, :index, :show]
end
