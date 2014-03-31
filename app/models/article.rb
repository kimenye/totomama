class Article < ActiveRecord::Base
  belongs_to :admin
  belongs_to :category
  attr_accessible :content, :status, :title, :admin_id, :category_id
end
