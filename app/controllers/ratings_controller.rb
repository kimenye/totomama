class RatingsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @rating = @product.ratings.create(params[:val])

    respond_to do |format|
      format.json { render json: @rating, status: :created, location: @rating }
    end
  end
end
