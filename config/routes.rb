RubyWiki::Application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'pages#index'

  resources :pages

  get '/pages/:id', to: 'pages#show', constraints: { id: /.+/ }
end
