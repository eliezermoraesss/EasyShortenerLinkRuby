Rails.application.routes.draw do
  # Página inicial
  root 'links#index'
  
  # Rotas para criar e listar links
  resources :links, only: [:index, :create]
  
  # Rota para redirecionamento
  get '/:short_url', to: 'links#redirect', as: 'short'
end