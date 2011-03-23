class Cookbook < ActiveRecord::Base
  attr_accessible :title, :description
  
  belongs_to :user
  
  validates :title, :presence => true, :length => { :maximum => 32 }
  validates :user_id, :presence => true

  default_scope :order => 'cookbooks.created_at DESC'
end
