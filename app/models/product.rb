class Product < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  # belongs_to :category
  has_many :ratings, :dependent => :destroy
  has_many :product_types, :through => :product_type_products
  has_many :product_type_products
  has_many :categories, :through => :product_categories
  has_many :product_categories
  attr_accessible :description, :name, :price, :rating, :category_id, :impressions_count

  attr_accessible :photo
  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/coming-soon.png"
  do_not_validate_attachment_file_type :photo

  def should_generate_new_friendly_id?
    new_record?
  end

  def self.inherited(child)
    child.instance_eval do
      def model_name
        Product.model_name
      end
    end
    super
  end
end
