require File.dirname(__FILE__) + '/../test_helper'
require 'units_controller'

# Re-raise errors caught by the controller.
class UnitsController; def rescue_action(e) raise e end; end

class UnitsControllerTest < Test::Unit::TestCase
  fixtures(:users)  
    
  context 'a logged user' do
    setup {
      
      @controller = UnitsController.new
      @request    = ActionController::TestRequest.new
      @response   = ActionController::TestResponse.new
      
      login_as(:quentin)
    }
    
    context 'on get to :new' do
      setup {
        get :new
      }
      
      should_respond_with :success
      should_assign_to :unit
      should_render_template 'new'
    end
    
  end
 
end
