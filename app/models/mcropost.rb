class Mcropost < ActiveRecord::Base
	#validates :content, :length => { :maximum => 140 }
	attr_accessible :content
	belongs_to :user
	default_scope :order=>'mcroposts.created_at DESC'
end
