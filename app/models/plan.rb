class Plan < ApplicationRecord

  has_many :items

  include Tokenable

  validates_presence_of :name

  def watt_hours
    self.items.map{|i| i.watt_hours}.sum
  end

  def active_watt_hours
    self.items.map{|i| i.active_watt_hours}.compact.sum
  end

  def items_by_priority priority
    self.items.where(priority: priority)
  end

  def active_items_by_priority priority
    self.items.where(priority: priority, active: true)
  end

  def active_items_watts_by_priority priority
    self.active_items_by_priority(priority).map{ |i| i.watt_hours}.compact.sum
  end


  after_create :add_default_items

  def add_default_items
    need = Priority.find(1)
    want = Priority.find(2)
    lux  = Priority.find(3)

    self.items.create!(name: 'Lights', watts: 20, hours: 12, priority: need)
    self.items.create!(name: 'Freezer', watts: 150, hours: 8, priority: need)    
    self.items.create!(name: 'Fan', watts: 40, hours: 16, priority: need)

    self.items.create!(name: 'TV', watts: 200, hours: 4, priority: want)
    self.items.create!(name: 'Computer', watts: 120, hours: 4, priority: want)
    self.items.create!(name: 'More Lights', watts: 40, hours: 6, priority: want)
    self.items.create!(name: 'Clothes Washer', watts: 500, hours: 1, priority: want)    
    self.items.create!(name: 'Fridge', watts: 150, hours: 8, priority: want)    
    self.items.create!(name: 'Espresso', watts: 350, hours: 1, priority: want)

    self.items.create!(name: 'AC', watts: 1500, hours: 7, priority: lux)
    self.items.create!(name: 'Clothes Dryer', watts: 1500, hours: 2, priority: lux)    
    self.items.create!(name: 'Coffee Maker', watts: 1000, hours: 2, priority: lux) 
    self.items.create!(name: 'Microwave', watts: 250, hours: 1, priority: lux)  
    self.items.create!(name: 'Pump', watts: 500, hours: 24, priority: lux)    

  end
end

