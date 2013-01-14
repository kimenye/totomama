class HomeController < ApplicationController
  def index
    product_categories
    @popular_products = Item.order("impressions_count DESC").limit(6)
    @popular_shops = Shop.where('type = ?', 'Shop').order("impressions_count DESC").limit(6)
    @popular_events = Event.order("impressions_count DESC").limit(6)
  end

  #GET /search
  def search
    product_categories
    term = params[:term]
    @matching_products = Item.where('name LIKE ? or description LIKE ?', "%#{term}%", "%#{term}%").all
    @matching_shops = Shop.where('name LIKE ? or description LIKE ?', "%#{term}%", "%#{term}%").all
    @matching_events = Event.where('name LIKE ? or description LIKE ?', "%#{term}%", "%#{term}%").all

    respond_to do |format|
      format.html { render :layout => 'layouts/application'}
      #format.json { render json: @product }
      format.json  { render :json => {:matching_products => @matching_products,
                                      :matching_shops => @matching_shops,
                                      :matching_events => @matching_events} }
    end

  end

end