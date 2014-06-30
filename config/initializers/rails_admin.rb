RailsAdmin.config do |config|
  # Rails.application.eager_load!
  # config.included_models = ActiveRecord::Base.descendants.map!(&:name)

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.included_models = ['Product', 'Category', 'Lead', 'Item', 'Event', 'Rating', 'ProductType', 'Stage', 'Shop']

  # config.model 'Item' do
  #   navigation_label 'Item'
  # end

  # config.model 'Shop' do
  #   navigation_label 'Shop'
  # end
  config.model 'Shop' do
    label "Shop" 
    label_plural "Shops"
  end
  config.model 'Event' do
    label "Event" 
    label_plural "Events"
  end
  config.model 'Item' do
    label "Item" 
    label_plural "Items"
  end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
