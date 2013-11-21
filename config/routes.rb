RubyWiki::Application.routes.draw do
  root to: 'pages#index'

  devise_for :users

  ActiveAdmin.routes(self)

  resources :pages, except: [:destroy] do
    member do
      get :versions
    end

    collection do
      get :preview
    end
  end

  resources :help, only: :none do
    collection do
      get :markdown_reference
    end
  end

  get '/pages/:id/edit',     to: 'pages#edit',     constraints: { id: /.+/ }
  get '/pages/:id/versions', to: 'pages#versions', constraints: { id: /.+/ }
  get '/pages/:id',          to: 'pages#show',     constraints: { id: /.+/ }
end
