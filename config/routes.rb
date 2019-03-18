Rails.application.routes.draw do
  # topics
  get 'topics/search_result' => 'topics#search_result'
  resources :topics
end
