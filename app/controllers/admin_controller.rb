class AdminController < ApplicationController
  
  before_filter :check_if_admin
#  if I want to show this layout for all methods of the  controller
#  layout "admin"
  
  def users_count
    @users_count = User.count
#    if I want to show this layout only for current method
    render layout: "admin"
  end
  
end
