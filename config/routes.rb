Rails.application.routes.draw do

  # map.resources :home, :collection=>{:index => :get, :get_income_tax => :post}
  get 'home/index'

  root to: "home#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'
end
