Rails.application.routes.draw do
  get 'conf/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'start/show'
  get 'conf' =>'conf#index'
  resources :tasks
  resources :branches do
    resources :tasks
  end


  root 'start#show'
end
