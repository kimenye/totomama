Totomama::Application.routes.draw do
  resources :leads


  #mount Mercury::Engine => '/'

  resources :articles


  mount Ckeditor::Engine => '/ckeditor'

  devise_for :admins

  resources :stages


  resources :products, :shallow => true do
    resources :ratings
  end

  resources :categories

  root :to => "leads#new"

  match 'administration' => 'admin#index', :as => :admin_area

  match 'shops' => 'products#index', :as => :shop_list, :defaults => { :type => 'Shop' }
  match 'events' => 'products#index', :as => :event_list, :defaults => { :type => 'Event' }

  match 'search' => 'home#search'

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
