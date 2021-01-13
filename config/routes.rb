Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :projects
  resources :users
  namespace :api, defaults: {format: :json} do
    post 'login' => 'sessions#create'
    resources :records do
      get :list_with_month, on: :collection
    end
    resources :projects, only: :index
    resources :users, only: [] do
      patch :update_password, on: :collection
    end
  end

  namespace :admin do
    root 'welcome#index'
    get 'output' => 'welcome#output'
    get 'login' => 'sessions#new'
    post 'login' => 'sessions#create'
    delete 'logout' => 'sessions#destroy'
    resources :users, only: [:index, :new, :create, :edit, :update] do
      get :record_list, on: :member
    end
    resources :admins
    resources :projects do
      get :statistics, on: :member
    end
  end
end
