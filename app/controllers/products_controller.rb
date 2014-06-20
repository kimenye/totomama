class ProductsController < ApplicationController
  layout "admin"
  # GET /products
  # GET /products.json
  def index
    type = params[:type].nil? ? "Item" : params[:type]
    @products = Product.where(:type => type)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    product_categories
    @product = Product.friendly.find(params[:id])

    impressionist(@product)
    @product.impressions_count = @product.impressionist_count
    @product.save!

    @cross_sell_products = Product.where('category_id = ? and id != ?', @product.category_id, @product.id).limit(6)

    respond_to do |format|
      format.html { render :layout => 'layouts/application'}
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    puts "#{params}"
    if params[:type] == "Shop"
      @product = Shop.new
    elsif params[:type] == "Event"
      @product = Event.new
    else
      @product = Product.new
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    if params[:type] == "Shop"
      @product = Shop.new(params[:product])
    elsif params[:type] == "Event"
      @product = Event.new(params[:product])
    else
      @product = Item.new(params[:product])
    end

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end

  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end
end
