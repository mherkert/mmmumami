class Recipe < ActiveRecord::Base
  attr_accessible :title, :instructions
  
  belongs_to :user
  belongs_to :cookbook

  validates :title, :presence => true, :length => { :maximum => 128 }
  validates :instructions, :presence => true
  validates :user_id, :presence => true
  validates :cookbook_id, :presence => true

  default_scope :order => 'recipes.created_at DESC'
end
