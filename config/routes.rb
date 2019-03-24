Rails.application.routes.draw do
  # topics
  get 'topics/search_result' => 'topics#search_result'
  resources :topics
  # users
  resources :users
  get 'login' => 'users#login_form'
  post 'login' => 'users#login'
  post 'logout' => 'users#logout'
  # home
  get '/' => 'home#top'
  get '/about' => 'home#about'
end
