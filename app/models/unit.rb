require 'digest/sha1'
require 'rdiscount'

class Unit < ActiveRecord::Base
  belongs_to :user
  
  named_scope :latest , :limit => 1, :order => 'created_at DESC'
  
  before_create do |unit|
    unit.token = Digest::SHA1.hexdigest("--#{unit.created_at}--#{unit.body}--")
  end
  
  def next_from_author
    Unit.first(:conditions => ['created_at > ? AND user_id = ?', self.created_at, self.user_id], :order => 'created_at ASC')
  end
    
  def prev_from_author
    Unit.first(:conditions => ['created_at < ? AND user_id = ?', self.created_at, self.user_id], :order => 'created_at DESC')
  end

  def next
    Unit.first(:conditions => ['created_at > ?', self.created_at], :order => 'created_at ASC')
  end
  
  def prev
    Unit.first(:conditions => ['created_at < ?', self.created_at], :order => 'created_at DESC')
  end
  
  def body_html
    RDiscount.new(self.body).to_html
  end
  

end
