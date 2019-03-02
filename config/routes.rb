Rails.application.routes.draw do
  # home
get '/' => 'home#top'
get '/about' => 'home#about'

end
