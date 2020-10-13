Rottenpotatoes::Application.routes.draw do
  resources :movies do
    get "with_same_director"
  end
  root :to => redirect('/movies')
end
