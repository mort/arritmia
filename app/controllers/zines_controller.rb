class ZinesController < ApplicationController
  before_filter :login_required
  
  def show
    @user = current_user
  end
end
