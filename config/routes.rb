Rails.application.routes.draw do
  resources :recipes

  root 'recipes#index'

  get 'show' => 'recipes#show'

  get 'edit' => 'recipes#edit'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
