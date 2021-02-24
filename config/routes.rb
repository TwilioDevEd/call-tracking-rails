Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'call-tracking/forward-call' => 'call_tracking#forward_call', as: :forward_call
  get 'statistics/leads_by_source' => 'statistics#leads_by_source', as: :leads_by_source
  get 'statistics/leads_by_city' => 'statistics#leads_by_city', as: :leads_by_city

  resources :lead_sources, only: [:create, :edit, :update]
  resources :available_phone_numbers, only: [:index]

  root 'dashboard#index'
end
