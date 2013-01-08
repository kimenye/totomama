class HomeController < ApplicationController
  def index
    product_categories
    @popular_products = Item.order("impressions_count DESC").limit(6)
    @popular_shops = Shop.order("impressions_count DESC").limit(6)
  end

end
