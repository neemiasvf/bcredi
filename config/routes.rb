Rails.application.routes.draw do
  resources :searches do
    member do
      get 'update_results', to: 'searches#update_results'
    end
  end
  get 'welcome/index'
  root 'welcome#index'
end
