Rails.application.routes.draw do
  resources :searches, except: :edit
  root 'searches#index'
end
