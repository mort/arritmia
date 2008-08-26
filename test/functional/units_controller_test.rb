require File.dirname(__FILE__) + '/../test_helper'
require 'units_controller'

# Re-raise errors caught by the controller.
class UnitsController; def rescue_action(e) raise e end; end

class UnitsControllerTest < Test::Unit::TestCase
 
  context 'a logged user' do
    setup {
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
