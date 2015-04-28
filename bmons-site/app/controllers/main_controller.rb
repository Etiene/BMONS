class MainController < ApplicationController
  def index
  end
  def admin
  	if current_user.access_level != 99
  		render :text => 'Access denied.', :status => '303'
  	end
  end

   def adminBecomeUser
    return unless current_user.access_level == 99
    sign_in(:user, User.find(params[:id]))
    redirect_to root_url # or user_root_url
  end
end
