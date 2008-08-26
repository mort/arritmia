class UsersController < ApplicationController
  before_filter :login_required, :except => :show

  # render new.rhtml
  def new
  end
  
  def show
    @user = User.find(params[:id])
    redirect_to user_unit_path(@user, @user.latest_unit)
  end

  def create
    cookies.delete :auth_token
    reset_session
    @user = User.new(params[:user])
    @user.save!
    self.current_user = @user
    redirect_back_or_default('/')
    flash[:notice] = "Thanks for signing up!"
  rescue ActiveRecord::RecordInvalid
    render :action => 'new'
  end
  

end
