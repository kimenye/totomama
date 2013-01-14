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
    @matching_shops = Shop.where('type = "Shop" and (name LIKE ? or description LIKE ?)', "%#{term}%", "%#{term}%").all
    @matching_events = Event.where('name LIKE ? or description LIKE ?', "%#{term}%", "%#{term}%").all
    @matching_articles = Article.where('title LIKE ? or content LIKE ?', "%#{term}%", "%#{term}%").all

    @matching_products_limited = @matching_products[0..3]
    @matching_shops_limited = @matching_shops[0..3]
    @matching_events_limited = @matching_events[0..3]
    @matching_articles_limited = @matching_articles[0..3]

    @matching_products_extra = @matching_products[4, 2]
    @matching_shops_extra = @matching_shops[4, 2]
    @matching_events_extra = @matching_events[4, 2]
    @matching_articles_extra = @matching_articles[4, 2]

    @related_search = Array.new

    if @matching_products_extra
      @related_search += @matching_products_extra
    end

    if @matching_shops_extra
      @related_search += @matching_shops_extra
    end

    if @matching_events_extra
      @related_search += @matching_events_extra
    end

    if @matching_articles_extra
      @related_search += @matching_articles_extra
    end

    respond_to do |format|
      format.html { render :layout => 'layouts/application'}
      #format.json { render json: @product }
      #format.json  { render :json => {:matching_products => @matching_products,
      #                                :matching_shops => @matching_shops,
      #                                :matching_events => @matching_events,
      #                                :matching_articles => @matching_articles} }
    end

  end

end