RubyWiki::Application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'pages#index'

  resources :pages, expect: [:destroy] do
    get :versions
  end

  get '/pages/:id/edit',     to: 'pages#edit',     constraints: { id: /.+/ }
  get '/pages/:id/versions', to: 'pages#versions', constraints: { id: /.+/ }
  get '/pages/:id',          to: 'pages#show',     constraints: { id: /.+/ }
end
