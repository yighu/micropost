class Mcropost < ActiveRecord::Base
	#validates :content, :length => { :maximum => 140 }
	attr_accessible :content
	belongs_to :user
	default_scope :order=>'mcroposts.created_at DESC'

	def self.from_users_followed_by(user)
		where(:user_id=>user.following.push(user))
	end

	scope :from_users_followed_by, lambda { |user| followed_by(user) }

	  private

	      # Return an SQL condition for users followed by the given user.
	  #     # We include the user's own id as well.
	  def self.followed_by(user)
	  #following_ids = user.following_ids
	  following_ids = %(SELECT followed_id FROM relationships
			                            WHERE follower_id = :user_id)
	  where("user_id IN (#{following_ids}) OR user_id = :user_id",
	  { :user_id => user })
	  end
end
