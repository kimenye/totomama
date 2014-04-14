class LeadsController < ApplicationController
  before_filter :authenticate_admin!, :except => [:thankyou, :new, :create]
  include VisualCaptcha::ControllerHelpers
  layout "landing"
  # GET /leads
  # GET /leads.json
  def index
    #product_categories
    @leads = Lead.all
    respond_to do |format|
      format.html { render :layout => 'layouts/admin' }# index.html.erb
      format.json { render json: @leads }
    end
  end

  # GET /leads/1
  # GET /leads/1.json
  def show
    #product_categories
    @lead = Lead.find(params[:id])

    respond_to do |format|
      format.html  { render :layout => 'layouts/admin' } # show.html.erb
      format.json { render json: @lead }
    end
  end

  def drop_downs
    #@type_options = ["Retail Shop","Wholesale Shop", "Online Shop", "Individual", "Other"]

    @target_options = ["Babies", "Toddlers", "Pre Schoolers", "School Age", "Pregnancy", "Postnatal", "Parents"]

    @type_options = ["Activities (Indoor/Outdoor)", "Baby Clothes & Shoes", "Baby Equipment & Accessories", "Baby Feeding & Nutrition",
                     "Child Birth", "Childcare, House-helps & Nannies", "Child Friendly Restaurants & Cafes", "Classes & Playgroups",
                     "Diet & Fitness", "Educational Products & Services", "Entertainment, Party Supplies, Party Planners", "Events",
                     "First Aid & Safety", "For Mum & Dad", "Furniture", "Government Agencies", "Health & Medical Centers", "Parenting Information",
                     "Pregnancy, Antenatal & Postnatal Health", "Professionals & Consultants", "Maternity Clothes & Shoes", "Second Hand & Pre-loved",
                     "Shops - High Streets", "Shops - Open Market", "Shops - Online", "Support Groups", "Toys & Gifts", "Websites and Resources", "Other"]

  end

  # GET /leads/new
  # GET /leads/new.json
  def new
    #product_categories
    @lead = Lead.new

    drop_downs

    respond_to do |format|
      format.html # new.html.erb   why is this commented out, why do we want to render json instead of html.erb
      format.json { render json: @lead }
    end
  end

  # GET /leads/1/edit
  def edit
    @lead = Lead.find(params[:id])
    respond_to do |format|
      format.html { render :layout => 'layouts/admin' }
    end
  end

  def thankyou

  end

  # POST /leads
  # POST /leads.json
  def create
    @lead = Lead.new(params[:lead])
    if !visual_captcha_valid?
      drop_downs
      respond_to do |format|
        flash[:notice] = 'Error with the human test.'
        format.html { render action: "new" }
      end
    else
      respond_to do |format|
        if @lead.save
          format.html { redirect_to thank_you_path, notice: 'Lead was successfully created.' }
          format.json { render json: @lead, status: :created, location: @lead }
        else
          format.html { render action: "new" }
          format.json { render json: @lead.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PUT /leads/1
  # PUT /leads/1.json
  def update
    @lead = Lead.find(params[:id])

    respond_to do |format|
      if @lead.update_attributes(params[:lead])
        format.html { redirect_to @lead, notice: 'Lead was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lead.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leads/1
  # DELETE /leads/1.json
  def destroy
    @lead = Lead.find(params[:id])
    @lead.destroy

    respond_to do |format|
      format.html { redirect_to leads_url }
      format.json { head :no_content }
    end
  end
end
