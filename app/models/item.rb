class Item < ApplicationRecord
  belongs_to :plan

  default_scope {order('priority ASC')} 

  def watt_hours
    self.watts * self.hours
  end

  PRIORITY = ['', "Need", "Want", "Luxury"]
  def priority_name
    PRIORITY[self.priority]
  end

end
