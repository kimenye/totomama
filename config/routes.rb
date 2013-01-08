Totomama::Application.routes.draw do
  resources :articles


  mount Ckeditor::Engine => '/ckeditor'

  devise_for :admins

  resources :stages


  resources :products, :shallow => true do
    resources :ratings
  end

  resources :categories

  root :to => "home#index"

  match 'administration' => 'admin#index', :as => :admin_area

  get '/channel.html' => proc {
    [
        200,
        {
            'Pragma'        => 'public',
            'Cache-Control' => "max-age=#{1.year.to_i}",
            'Expires'       => 1.year.from_now.to_s(:rfc822),
            'Content-Type'  => 'text/html'
        },
        ['<script type="text/javascript" src="//connect.facebook.net/en_US/all.js"></script>']
    ]
  }
end
