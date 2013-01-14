class HomeController < ApplicationController
  def index
    product_categories
    @popular_products = Item.where('type = ?', 'Item').order("impressions_count DESC").limit(6)
    @popular_shops = Shop.where('type = ?', 'Shop').order("impressions_count DESC").limit(6)
    @popular_events = Event.where('type = ?', 'Event').order("impressions_count DESC").limit(6)
  end

end