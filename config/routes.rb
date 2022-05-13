Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/libraries', to:'libraries#index'
  get '/libraries/:id', to: 'libraries#show'
  get '/books', to: 'books#index'
  get '/books/:id', to: 'books#show'
  get '/libraries/:library_id/books', to: 'library_books#index'
end
