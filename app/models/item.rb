class Item < ApplicationRecord
  
  belongs_to :plan
  belongs_to :priority

  default_scope {order('priority_id ASC')} 

  validates_presence_of :name, :watts, :hours#, :priority

  def watt_hours
    (self.watts * self.hours) 
  end

  def active_watt_hours
    self.watt_hours if self.active?
  end

  def self.options_for_priority
    Priority.all.map{| p | [p.name, p.id]}
  end

end
