Rails.application.routes.draw do
  # topics
  resources :topics
  post 'topics/search_result' => 'topics#search_result'
end
