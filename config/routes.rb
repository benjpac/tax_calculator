Rails.application.routes.draw do
  get 'sessions/create'

  get 'sessions/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'
end
