class ApplicationController < ActionController::Base
  protect_from_forgery

  def product_categories
    #categories = Category.all
    #
    #@categories = []
    #categories.each do |c|
    #  @categories <<  {
    #      :category => c,
    #      :products => Product.find_all_by_category_id(c.id)
    #  }
    #end


    stages = Stage.all
    @categories = []
    stages.each do |s|
      @categories << {
          :stage => s,
          :categories => Category.find_all_by_stage_id(s.id)
      }
    end
  end
end
