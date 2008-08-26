require 'digest/sha1'

class Unit < ActiveRecord::Base
  belongs_to :user
  
  before_create do |unit|
    unit.token = Digest::SHA1.hexdigest("--#{unit.created_at}--#{unit.body}--")
  end
  
  def next_from_author
    Unit.find(:first, :conditions => ['created_at > ? AND user_id = ?', created_at, user_id], :order => 'created_at DESC')
  end
    
  def prev_from_author
    Unit.find(:first, :conditions => ['created_at < ? AND user_id = ?', created_at, user_id], :order => 'created_at DESC')
  end

  def next
    Unit.find(:first, :conditions => ['created_at > ?', created_at], :order => 'created_at DESC')
  end
  
  def prev
    Unit.find(:first, :conditions => ['created_at < ?', created_at], :order => 'created_at DESC')
  end
  
  def self.latest
    find(:first, :order => 'created_at DESC')
  end
  
end
