Rails.application.routes.draw do
  # topics
  post 'topics/search_result' => 'topics#search_result'
  get 'topics/index' => 'topics#index'
  get 'topics/new' => 'topics#new'
  post 'topics/create' => 'topics#create'
  get 'topics/:id' => 'topics#show'
  get 'topics/:id/edit' => 'topics#edit'
end
