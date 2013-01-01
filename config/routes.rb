Totomama::Application.routes.draw do
  resources :categories


  root :to => "home#index"
end
