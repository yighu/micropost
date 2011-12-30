class PagesController < ApplicationController
  def home
	 @title = "Home"
	 @mcropost = Mcropost.new if signed_in?
	 @feed_items = current_user.feed.paginate(:page => params[:page])
  end

  def contact
	  @title="Contact"
  end
 def about
 	@title="About"
 end
end
