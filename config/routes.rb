Rails.application.routes.draw do
  resources :searches
  get 'welcome/index'

  root 'welcome#index'
end
