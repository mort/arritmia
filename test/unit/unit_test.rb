require File.dirname(__FILE__) + '/../test_helper'

class UnitTest < Test::Unit::TestCase
  #fixtures :units

  context 'a unit' do
   setup {
     @user = Factory(:user)
     @user.units << Factory(:unit, :created_at => Time.now)
     @user.units << Factory(:unit, :body => 'b', :created_at => Time.now + 1.minute)
     @user.units << Factory(:unit, :body => 'c', :created_at => Time.now + 2.day)
    
     @a_unit = Unit.find_by_body('a')
     @b_unit = Unit.find_by_body('b')
     @c_unit = Unit.find_by_body('c')
      
   }
   
   should 'have a token' do
    assert_not_nil @a_unit.token
   end
   
   context 'first unit from an author' do
  
     should 'have not prev unit' do
       assert_nil @a_unit.prev_from_author
     end

     should 'have a next unit' do
      assert_not_nil @a_unit.next_from_author 
     end
     
     should 'have the right next unit' do
      assert @a_unit.next_from_author === @b_unit
     end
     
   end
   
   context 'an unit from an author' do
     should 'have a prev unit' do
       assert_not_nil @b_unit.prev_from_author
     end
     
     should 'have the right prev unit' do
       assert @b_unit.prev_from_author === @a_unit
      end

     should 'have a next unit' do
      assert_not_nil @b_unit.next_from_author 
     end
     
     should 'have the right next unit' do
      assert @b_unit.next_from_author === @c_unit
     end
   end
   
   context 'latest unit from an author' do
  
     should 'have a prev unit' do
       assert_not_nil @c_unit.prev_from_author
     end
     
     should 'have the right prev unit' do
      assert @c_unit.prev_from_author === @b_unit
     end

     should 'not have a next unit' do
      assert_nil @c_unit.next_from_author 
     end

     
   end
   
   
  
  end
  
end
