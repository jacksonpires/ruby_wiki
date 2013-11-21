RubyWiki::Application.routes.draw do
  root to: 'pages#index'

  devise_for :users

  ActiveAdmin.routes(self)

  resources :pages, expect: [:destroy] do
    member do
      get :preview
      get :versions
    end
  end

  get '/pages/:id/edit',     to: 'pages#edit',     constraints: { id: /.+/ }
  get '/pages/:id/versions', to: 'pages#versions', constraints: { id: /.+/ }
  get '/pages/:id/preview',  to: 'pages#preview',  constraints: { id: /.+/ }
  get '/pages/:id',          to: 'pages#show',     constraints: { id: /.+/ }
end
