Totomama::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
# , ActiveAdmin::Devise.config
#   ActiveAdmin.routes(self)
  resources :leads

  # match '/terms', :to => redirect('/terms.html')
  get '/terms', to: 'pages#terms'
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
  #root :to => "home#index"

  get 'administration' => 'admin#index', :as => :admin_area

  get 'shops' => 'products#index', :as => :shop_list, :defaults => { :type => 'Shop' }
  get 'events' => 'products#index', :as => :event_list, :defaults => { :type => 'Event' }

  get 'search' => 'home#search'
  get 'thankyou' => 'leads#thankyou', :as => :thank_you

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
