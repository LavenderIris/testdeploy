Rails.application.routes.draw do
  get 'events/index'

  post 'users/create' => 'users#create'
  get 'main'  => 'sessions#index'
  post 'sessions/login'  => 'sessions#login'
  get 'groups/:id'  => 'orgs#show'
  get 'groups'  => 'orgs#index' 
  post 'leave/:id' => 'orgs#leave'
  post 'join/:id' => 'orgs#join'
  post 'orgs/create'  => 'orgs#create'
  post 'logout' => 'sessions#logout'
  delete 'delete/:id'  => 'orgs#delete'

end
