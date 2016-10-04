Rails.application.routes.draw do
  post 'sessions/log_in' => 'sessions#log_in'

  post 'sessions/log_out' => 'sessions#log_out'

  get 'users/index'

  get 'users/show/:id' => 'users#show'

  post 'users/create' => 'users#create'

  get 'users/new' => 'users#index'

  get 'users/edit'

  put 'users/update'

  delete 'users/destroy'

end
