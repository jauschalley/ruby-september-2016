Rails.application.routes.draw do

  get 'users' => 'users#index'

  get 'friends/create/:id' => 'friends#create'

  get 'friends/:id/destroy' => 'friends#destroy'

  get 'users/:id/show' => 'users#show'

  get 'friends/update/:id' => 'friends#update'

  get 'users/all' => 'users#all'

  post 'users/create' => 'users#create'

  get 'users/new' 

  get 'users/view/:id' => 'users#view'

  get 'users/destroy'

  post 'sessions/create' => 'sessions#create'

  get 'sessions/destroy' => 'sessions#destroy'

  
end
