Rails.application.routes.draw do

resources :authors 
resources :books
resources :genres, only: [:index, :create, :update, :destroy, :set_genre]
resources :publishers, only: [:index, :create, :update, :destroy, :set_publisher]

get 'authors/:id/books', to: "authors#books_index"

end
