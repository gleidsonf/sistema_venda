Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products, only: [:index, :new, :create, :destroy, :update]
  resources :sales
  resources :sale_items
  post "/finished" => "carts#finished" 

  root "products#index"
end
