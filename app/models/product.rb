class Product < ActiveRecord::Base
  is_impressionable :counter_cache => true
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :category
  has_many :ratings, :dependent => :destroy
  attr_accessible :description, :name, :price, :rating, :category_id

  attr_accessible :photo
  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  def should_generate_new_friendly_id?
    new_record?
  end
end
