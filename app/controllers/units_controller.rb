class UnitsController < ApplicationController
  before_filter :get_author
  before_filter :login_required, :except => 'show'
  
  def index
    @units = @author.units
    respond_to do |format|
      format.atom
    end
  end

  def show
    @unit = @author.units.find(params[:id]) unless @author.nil?
  end

  def new
    @unit = Unit.new
  end

  def create
    @unit = current_user.units.build(params[:new_unit])

    respond_to do |format|
      if @unit.save
        flash[:notice] = 'Unit was successfully created.'
        format.html { redirect_to user_unit_url(current_user, @unit) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /units/1
  # PUT /units/1.xml
  def update
    @unit = current_user.units.find(params[:id])

    respond_to do |format|
      if @unit.update_attributes(params[:unit])
        flash[:notice] = 'Unit was successfully updated.'
        format.html { redirect_to unit_url(@unit) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @unit.errors.to_xml }
      end
    end
  end

  # DELETE /units/1
  # DELETE /units/1.xml
  def destroy
    @unit = current_user.units.find(params[:id])
    @unit.destroy

    respond_to do |format|
      format.html { redirect_to units_url }
      format.xml  { head :ok }
    end
  end
  
  private
  
  def get_author
    @author = User.find(params[:user_id]) rescue nil
  end
  
end
