Rails.application.routes.draw do
 
  resources :receipts
  resources :trays
  resources :invitations
  
  root "receipts#index"
  
  get '/home' => 'receipts#index'
  get '/login' => redirect('/auth/google_oauth2')
  get '/signup' => 'users#new'
  get '/goodbye' => 'sessions#goodbye'
  delete '/logout' => 'sessions#destroy' 

  post '/incoming' => 'incoming#create'

  get '/auth/:provider/callback' => 'sessions#omniauth'

  mount ActionCable.server => '/cable'
end
