Rails.application.routes.draw do
  root 'metrics#index'
  resources :metrics, only: [:index] do
    resources :values, only: [:index, :edit, :update]
  end
end
