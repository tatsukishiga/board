Rails.application.routes.draw do
  # comments
resources :comments
  # home
get '/' => 'home#top'
get '/about' => 'home#about'

end
