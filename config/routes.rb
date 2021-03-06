Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/libraries', to:'libraries#index'
  get '/libraries/new', to: 'libraries#new'
  get '/libraries/:id', to: 'libraries#show'
  get '/books', to: 'books#index'
  get '/books/:id', to: 'books#show'
  get '/libraries/:library_id/books', to: 'library_books#index'
  post '/libraries', to: 'libraries#create'
  get '/libraries/:library_id/edit', to: 'libraries#edit'
  patch '/libraries/:library_id', to: 'libraries#update'
  get '/libraries/:library_id/books/new', to: 'library_books#new'
  post '/libraries/:library_id/books', to: 'library_books#create'
  get '/books/:book_id/edit', to: 'books#edit'
  post '/books/:book_id', to: 'books#update'
  get '/libraries/:library_id/books/sort', to: 'library_books#sort'
  delete '/libraries/:library_id', to: 'libraries#destroy'
  delete '/books/:book_id', to: 'books#destroy'
end
