Rails.application.routes.draw do
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/top' => 'homes#top'
  get 'lists/new'
   post 'lists' => 'lists#create'
  get 'lists/:id' => 'lists#show'
  get 'lists/edit'
  get 'lists' => 'lists#index'
end