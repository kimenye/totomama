class HomeController < ApplicationController
  def index
    categories = Category.all

    @categories = []
    categories.each do |c|
      @categories <<  {
          :category => c,
          :products => Product.find_all_by_category_id(c.id)
      }
    end
  end
end
