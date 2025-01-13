Rails.application.routes.draw do
  root 'links#index'
  resources :links, only: [:index, :create]
  get '/:short_url', to: 'links#redirect', as: 'short'
end